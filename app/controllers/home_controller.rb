class HomeController < ApplicationController
	before_filter :authenticate_user!
	layout "home"
	def index
		relative_userids = [current_user.id] + current_user.follows.collect(&:follow_id)
		@users = User.where('id not in (?)', relative_userids)
		@tweets = Tweet.where('user_id in (?)', relative_userids).order('created_at DESC')
		@tweet = Tweet.new(:user_id => current_user.id)
	end
end
