class VotesController < ApplicationController
	def create
		@vote = Vote.new(vote_params)
		@votable = vote_params[:votable_type].classify.constantize.find(vote_params[:votable_id])
		@vote.user = current_user
		if @vote.save
			respond_to do |format|
				format.js
			end
		else
			flash.now.alert = "Already voted"
	
			# FAIL
		end
	end

	private

	def vote_params
		params.require(:vote).permit(:votable_type, :votable_id, :up)
	end
end