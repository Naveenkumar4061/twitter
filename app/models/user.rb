class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :tweets
	has_many :follows, :foreign_key => 'user_id'
	has_many :following, :class_name => 'Follow', :foreign_key => 'follow_id'

	def relate(user)
		self.follows.map(&:follow_id).include?(user.id) ? 'follow' : 'unfollow'
	end
end
