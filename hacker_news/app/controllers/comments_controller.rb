class CommentsController < ApplicationController
	before_action :set_comment, only: [:destroy]
	def create
		@comment = Comment.new(comment_params)
		@comment.user = current_user
		@comment.post_id = params[:post_id]
		if @comment.save
			respond_to do |format|
				format.js {} # What view? 
				format.json {render json: @comment}
			end
		else
			# Failure
		end
	end

	def destroy
		@temp_comment = @comment
		@comment.delete
	end

	private

	def set_comment
		@comment = Comment.find(params[:id])
	end

  def comment_params
    params.require(:comment).permit(:content)
  end
end