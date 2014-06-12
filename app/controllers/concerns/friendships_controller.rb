class FriendshipsController < ApplicationController
	def create 
		@friendship = current_user.friendships.build(friend_id: params[:friend_id])
		if @friendship.save
			redirect_to :back
		else 
			redirect to :back
		end
	end

	def destroy 
		@friendship = Friendship.find(params[:id])
		@friendship.destroy
		redirect_to :back
	end
end