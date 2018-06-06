class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Successfully created post.'
    else
      render :new, alert: 'Sorry, there was a problem saving.'
    end
  end

  def show
    @comments = @post.comments.order(created_at: :desc)
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Succesfully updated post.'
    else
      render :edit, alert: 'Sorry, there was a problem updating.'
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: 'Deleted post.'
    else
      redirect_back fallback_location: root_path
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :body)
  end
end
