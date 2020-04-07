class FriendsController < ApplicationController
	
	def search
		if params[:friend].present?
			@friends = User.search(params[:friend])
			@friends = current_user.except_current_user(@friends)
			if @friends.any?
				respond_to do |format|
					format.js { render partial: 'users/friend_result'}
				end 
			else
				respond_to do |format|
					flash.now[:alert] = "Could not find user"
					format.js { render partial: 'users/friend_result'}
				end
			end
		else
			respond_to do |format|
					flash.now[:alert] = "Please enter a friend to search"
					format.js { render partial: 'users/friend_result'}
			end
		end
	end


end