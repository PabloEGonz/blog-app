class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts
    render 'index'
  end

  def show
    @post = Post.find_by(id: params[:id])
    render 'show'
  end
end
