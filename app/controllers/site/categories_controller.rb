class Site::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
end
