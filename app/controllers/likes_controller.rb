class LikesController < ApplicationController
  def create
    post = Post.find_by(id: params[:post_id])
    new_like = Like.new(post:, user: current_user)
    if new_like.save
      flash[:success] = 'The comment was added!'
    else
      flash[:error] = 'Could not like comment'
    end
    redirect_to post_url(post)
  end
end
