class Site::SiteController < ApplicationController
  def index
    @posts = Post.published

    @pagy, @posts = pagy(@posts)
    render "site/index"
  rescue Pagy::OverflowError
    # redirect_to root_path(page: 1)
    params[:page] = 1
    retry
  end

  def categories
    @categories = Category.all
    render "site/categories"
  end

  def categoriesShow
    @category = Category.find(params[:id])

    @posts = Post.where().all
    render "site/categories_show"
  end
end
