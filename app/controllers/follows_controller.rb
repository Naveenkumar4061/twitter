class FollowsController < ApplicationController
	
	def followers
		@followers = current_user.following.map(&:user)
	end
	
	def following
		@following = current_user.follows.map(&:follower)
	end

	def follow
    @follow = Follow.create_follow(current_user.id,params[:id].strip)
		if @follow.errors.any?
		  flash[:error] = @follow.errors.full_messages
		end
		redirect_to '/'
	end

	def unfollow
    @follow = Follow.unfollow(current_user.id,params[:id].strip)
		redirect_to (:back)
	end
	
end
