class Follow < ActiveRecord::Base
	attr_accessible :user_id, :follow_id

	belongs_to :user, :class_name => 'User'
	belongs_to :follower, :class_name => 'User', :foreign_key => 'follow_id'
	
	validates :user_id, :uniqueness => { :message => 'already being followed', :scope => :follow_id}
	validates :user_id, :follow_id, :presence => true

	def self.create_follow(userid,followid)
		self.create(:user_id => userid, :follow_id => followid)
	end

	def self.unfollow(userid,followid)
		self.where(:user_id => userid, :follow_id => followid).delete_all
	end

end
