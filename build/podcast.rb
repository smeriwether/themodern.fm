require_relative "./episode"

class Podcast
  attr_reader :title, :sanitized_title, :subtitle, :artwork_url, :description, :author, :episodes

  def initialize(title:, sanitized_title:, subtitle:, artwork_url:, description:, author:, episodes:)
    @title = title
    @sanitized_title = sanitized_title
    @subtitle = subtitle
    @artwork_url = artwork_url
    @description = description
    @author = author
    @episodes = episodes
  end

  def url
    "#{@sanitized_title}.html"
  end

  def self.from_rss_feed(feed)
    Podcast.new(
      title: feed[:title],
      sanitized_title: sanitized_title(feed[:title]),
      subtitle: feed[:subtitle],
      artwork_url: feed[:artwork][:url],
      description: feed[:description],
      author: feed[:owner][:name],
      episodes: feed[:episodes].map do |episode_feed|
        Episode.from_rss_feed(episode_feed)
      end,
    )
  end

  def self.sanitized_title(title)
    title.gsub(" ", "-").downcase
  end
end
