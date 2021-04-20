require "pry"

require_relative "./podcast_rss_parser"
require_relative "./podcast"
require_relative "./home_page_writer"
require_relative "./podcast_page_writer"
require_relative "./episode_page_writer"
require_relative "./privacy_page_writer"
require_relative "./sitemap_writer"

puts "Starting website build!"

FEED_URLS = [
  "https://feeds.captivate.fm/a-modern-man/",
  "https://feeds.captivate.fm/fargo-watch-party/",
  "https://feeds.captivate.fm/a-modern-woman/",
]

podcasts = FEED_URLS.map do |feed_url|
  feed = PodcastRssParser.new(feed_url).parse!
  Podcast.from_rss_feed(feed)
end

HomePageWriter.new(podcasts).write!
PrivacyPageWriter.new.write!

podcasts.each do |podcast|
  PodcastPageWriter.new(podcast).write!
  podcast.episodes.each do |episode|
    EpisodePageWriter.new(podcast, episode).write!
  end
end

SitemapWriter.new.write!(podcasts)

puts "Finished website build!"
