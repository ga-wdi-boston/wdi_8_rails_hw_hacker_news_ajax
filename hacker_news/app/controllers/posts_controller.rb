class PostsController < ApplicationController
  def index
  	@posts = Post.all
  	@post = Post.new
  	respond_to do |format|
  		format.html
  		format.json {render json: @posts}
  	end
  end

  def create
  end

  def update
  end

  def destroy
  end
end
