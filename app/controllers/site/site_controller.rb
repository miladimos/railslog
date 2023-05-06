class Site::SiteController < ApplicationController
  def index
    @posts = Post.published

    @pagy, @posts = pagy(@posts)
  rescue Pagy::OverflowError
    # redirect_to root_path(page: 1)
    params[:page] = 1
    retry

    render html: "site/index"
  end
end
