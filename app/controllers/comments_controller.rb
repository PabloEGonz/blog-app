class CommentsController < ApplicationController
  def create
    post = Post.find_by(id: params[:post_id])
    new_comment = Comment.new(post:, user: current_user)
    new_comment.assign_attributes(params.require(:comment).permit(:text))
    if new_comment.save
      flash[:success] = 'The comment was added!'
      redirect_to post_url(post)
    else
      flash[:error] = 'Could not post comment'
      redirect_to post_url(post)
    end
  end
end
