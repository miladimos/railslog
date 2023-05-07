class Site::PostsController < ApplicationController
  def posts
    @posts = Post.published

    @pagy, @posts = pagy(@posts)
  rescue Pagy::OverflowError
    # redirect_to root_path(page: 1)
    params[:page] = 1
    retry

    render html: "site/index"
  end

  def post
    @post = Post.friendly.find(params[:id])
    impressionist(@post) #  @post.impressionist_count
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def create_comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy_comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
