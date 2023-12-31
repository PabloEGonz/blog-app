class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts.includes(comments: :user)
    render 'index'
  end

  def show
    @post = Post.includes(comments: :user).find_by(id: params[:id])
    render 'show'
  end

  def new
    @new_post = Post.new
    render 'new'
  end

  def create
    new_post = Post.new(author: current_user)
    new_post.assign_attributes(post_params)
    if new_post.save
      flash[:success] = 'The post was created!'
      redirect_to user_posts_url(current_user)
    else
      flash.now[:error] = 'Could not create post, try again'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    if post.destroy
      flash[:success] = 'The post was deleted'
      redirect_to user_posts_url(current_user)
    else
      flash.now[:error] = 'Could not delete post, try again'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
