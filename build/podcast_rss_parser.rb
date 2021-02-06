require "rss"
require "open-uri"

class PodcastRssParser
  def initialize(feed_url)
    @feed_url = feed_url
  end

  def parse!
    open(@feed_url) do |rss|
      feed = RSS::Parser.parse(rss)
      {
        title: feed.channel.title,
        subtitle: feed.channel.itunes_subtitle,
        description: feed.channel.description,
        owner: {
          name: feed.channel.itunes_owner.itunes_name,
          email: feed.channel.itunes_owner.itunes_email,
        },
        artwork: {
          title: feed.channel.image.title,
          url: feed.channel.image.url,
        },
        episodes: feed.channel.items.map.with_index do |episode, idx|
          {
            guid: episode.guid.content,
            title: episode.title,
            description: episode.description,
            author: episode.itunes_author,
            number: feed.channel.items.length - idx,
            artwork: {
              title: feed.channel.image.title,
              url: feed.channel.image.url,
            },
            published_at: episode.pubDate,
            channel: {
              title: feed.channel.title,
            },
          }
        end,
      }
    end
  end
end
