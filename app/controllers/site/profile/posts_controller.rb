class Site::Profile::PostsController < ApplicationController
  def new
    @post = Post.new
  end
end
