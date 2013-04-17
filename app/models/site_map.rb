require 'sitemap_generator'

class SiteMap

  def self.generate
    SitemapGenerator::Sitemap.default_host = "http://shastadogs.com"
    SitemapGenerator::Sitemap.create do
      Page.all.each do |page|
        add page_path(page), changefreq: "never", priority: 0.7
      end

      Post.all.each do |post|
        add post_path(post), changefreq: "never", priority: 0.7
      end
    end

    SitemapGenerator::Sitemap.ping_search_engines # called for you when you use the rake task
  end

end