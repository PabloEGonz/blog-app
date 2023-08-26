class LikesController < ApplicationController
    def create
      post = Post.find_by(id: params[:post_id])
      new_like = Like.new(post: post, user: current_user)
      if new_like.save
          flash[:success] = 'The comment was added!'
          redirect_to post_url(post)
      else
          flash[:error] = 'Could not like comment'
          redirect_to post_url(post)
      end
    end
  end