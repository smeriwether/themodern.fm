require "pry"
require "rss"
require "open-uri"
require "json"

FEED_URLS = [
  "https://feeds.captivate.fm/a-modern-man/",
  "https://feeds.captivate.fm/fargo-watch-party/",
  "https://feeds.captivate.fm/a-modern-woman/",
]

feed_data = FEED_URLS.map do |feed_url|
  URI.open(feed_url) do |rss|
    feed = RSS::Parser.parse(rss)
    slug = feed.channel.title.gsub(" ", "-").downcase
    {
      name: feed.channel.title,
      slug: slug,
      artwork_url: feed.channel.image.url,
      subtitle: feed.channel.itunes_subtitle,
      author: feed.channel.itunes_owner.itunes_name,
      description: feed.channel.description,
      episodes: feed.channel.items.map.with_index do |episode, idx|
        {
          name: episode.title,
          number: feed.channel.items.length - idx,
          slug: "#{slug}-#{episode.guid.content}",
          guid: episode.guid.content,
          description: episode.description,
          published_at: episode.pubDate,
          podcast_slug: slug,
        }
      end,
    }
  end
end

podcasts_data = feed_data.map do |feed|
  {
    name: feed[:name],
    slug: feed[:slug],
    artwork_url: feed[:artwork_url],
    subtitle: feed[:subtitle],
    author: feed[:author],
    description: feed[:description],
  }
end

episodes_data = feed_data.map do |feed|
  {
    feed[:slug] => {
      episodes: feed[:episodes].map do |episode|
        {
          name: episode[:name],
          number: episode[:number],
          slug: episode[:slug],
          guid: episode[:guid],
          description: episode[:description],
          published_at: episode[:published_at]

        }
      end
    }
  }
end.inject(:merge)

latest_episode_data = {
  podcast: feed_data.map do |feed|
    feed[:episodes]
  end.flatten.sort_by do |episode|
    episode[:published_at]
  end.last[:podcast_slug]
}

File.write("_data/podcasts.json", podcasts_data.to_json)
File.write("_data/episodes.json", episodes_data.to_json)
File.write("_data/latest_episode.json", latest_episode_data.to_json)
