class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @post
    else
      redirect_back fallback_location: root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body).merge(post_id: @post.id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
