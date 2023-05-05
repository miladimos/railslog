class Site::SiteController < ApplicationController
    def index
        @posts = Post.all 
        # :erb "site.index"       
    end

    def post 
        @post = Post.where(params[:id])
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