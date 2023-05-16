class Site::Profile::PostsController < ApplicationController
  before_action :redirect_if_not_authenticated, only: [:new]
  before_action :set_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
    else
    end
  end

  def edit
  end

  def show
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
    params.require(:post).permit(:title, :content, :category, :thubmnail)
  end

  def export_csv
    @posts = current_user.posts.all
    respond_to do |format|
      format.html
      format.csv do
        send_data Post.to_csv(@posts), filename: Data.today.to_s, content_type: "text/csv"
      end
    end
  end
end
