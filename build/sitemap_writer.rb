require "sitemap_generator"

class SitemapWriter
  def write!(podcasts)
    SitemapGenerator::Sitemap.default_host = "https://themodern.fm"
    SitemapGenerator::Sitemap.public_path = "./site/"
    SitemapGenerator::Sitemap.create do
      add "/privacy", changefreq: "monthly"
      podcasts.each do |podcast|
        add "/#{podcast.url.gsub(".html", "")}", changefreq: "weekly", priority: 0.9
        podcast.episodes.each do |episode|
          add "/#{episode.url.gsub(".html", "")}", changefreq: "monthly"
        end
      end
    end
  end
end
