class PostsController < ApplicationController
  before_action :set_post, only: [:destroy]

  def index
  	@posts = Post.all
  	@post = Post.new
  	respond_to do |format|
  		format.html
  		format.json {render json: @posts}
  	end
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      # We want to return json, yes
      render json: @post
    else
      #failure. todo. We'll come back to this.
    end
  end

  def update
  end

  def destroy
    @temp_post = @post
    @post.destroy
    respond_to do |format|
      format.js
    end
    # I think I want to respond with javascript. Maybe?
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :title, :link)
  end
end
