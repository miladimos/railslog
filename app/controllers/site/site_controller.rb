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
end