# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.railslog.com"
SitemapGenerator.verbose = false

SitemapGenerator::Sitemap.create do
  add index_path, :changefreq => "daily"

  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host

  add posts_path, :priority => 0.7, :changefreq => "daily"

  Post.find_each do |post|
    add posts_show_path(post), :lastmod => post.updated_at
  end
end
