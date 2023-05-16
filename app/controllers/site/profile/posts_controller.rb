class Site::Profile::PostsController < ApplicationController
  before_action :redirect_if_not_authenticated, only: [:new]
  before_action :set_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "post updated"
    else
    end
  end

  def destroy
    @post.destroy
    redirect_to post_url, notice: "Post was deleted"
  end

  private def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :category, :draft, :thubmnail)
  end
end
