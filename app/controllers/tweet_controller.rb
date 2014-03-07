class TweetController < ApplicationController

	def create
		Tweet.create(:text => params[:tweet][:text],:user_id => current_user.id)
		redirect_to '/'
	end
end
