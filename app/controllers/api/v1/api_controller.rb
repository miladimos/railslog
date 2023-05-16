class Api::V1::ApiController < Api::ApiBaseController
  def tags
    tags = Tag.all
    json_response(@tags)
  end

  def categories
    categories = Category.all
  end

  def posts
    posts = Post.all
  end

  def users
    users = User.all
  end
end
