require "pry"
require "rss"
require "open-uri"
require "json"
require_relative "./build_wsp"

FEED_URLS = [
  "https://feeds.captivate.fm/a-modern-man/",
  "https://feeds.captivate.fm/weekly-spread-podcast/",
]

PAST_FEED_URLS = [
  "https://feeds.captivate.fm/a-modern-woman/",
  "https://feeds.captivate.fm/fargo-watch-party/",
]

FEED_ARTWORK_DATA = {
  "https://feeds.captivate.fm/a-modern-man/" =>
    "https://themodern.fm/assets/a-modern-man-240x240.jpg",
  "https://feeds.captivate.fm/weekly-spread-podcast/" =>
    "https://themodern.fm/assets/wsp-240x240.jpg",
  "https://feeds.captivate.fm/a-modern-woman/" =>
    "https://themodern.fm/assets/a-modern-woman-240x240.jpg",
  "https://feeds.captivate.fm/fargo-watch-party/" =>
    "https://themodern.fm/assets/fargo-watch-party-240x240.jpg",
}

def fetch_feed_data(feed_url)
  URI.open(feed_url) do |rss|
    feed = RSS::Parser.parse(rss, { validate: false })
    slug = feed.channel.title.gsub(" ", "-").downcase
    {
      name: feed.channel.title,
      slug: slug,
      artwork_url: FEED_ARTWORK_DATA.dig(feed_url) || feed.channel.image.url,
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

def feed_to_podcast(feed)
  {
    name: feed[:name],
    slug: feed[:slug],
    artwork_url: feed[:artwork_url],
    subtitle: feed[:subtitle],
    author: feed[:author],
    description: feed[:description],
  }
end

def feed_to_episode(feed)
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
end

feed_data = FEED_URLS.map do |feed_url|
  fetch_feed_data(feed_url)
end

past_shows_feed_data = PAST_FEED_URLS.map do |feed_url|
  fetch_feed_data(feed_url)
end

podcasts_data = feed_data.map do |feed|
  feed_to_podcast(feed)
end

past_podcasts_data = past_shows_feed_data.map do |feed|
  feed_to_podcast(feed)
end

episodes_data = feed_data.map do |feed|
  feed_to_episode(feed)
end.inject(:merge)

past_episodes_data = past_shows_feed_data.map do |feed|
  feed_to_episode(feed)
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
File.write("_data/past_podcasts.json", past_podcasts_data.to_json)
File.write("_data/past_episodes.json", past_episodes_data.to_json)
File.write("_data/latest_episode.json", latest_episode_data.to_json)
File.write("_data/wsp_picks.json", wsp_picks_data.to_json)
