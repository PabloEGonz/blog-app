class CommentsController < ApplicationController
  def create
    post = Post.find_by(id: params[:post_id])
    new_comment = Comment.new(post:, user: current_user)
    new_comment.assign_attributes(comment_params)
    if new_comment.save
      flash[:success] = 'The comment was added!'
    else
      flash[:error] = 'Could not post comment'
    end
    redirect_to post_url(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
