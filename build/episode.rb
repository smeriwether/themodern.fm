class Episode
  attr_reader :guid, :title, :description, :author, :artwork_url, :number, :published_at, :podcast_title

  def initialize(guid:, title:, description:, author:, artwork_url:, number:, published_at:, podcast_title:, podcast_sanitized_title:)
    @guid = guid
    @title = title
    @description = description
    @author = author
    @artwork_url = artwork_url
    @number = number
    @published_at = published_at
    @podcast_title = podcast_title
    @podcast_sanitized_title = podcast_sanitized_title
  end

  def url
    "#{@podcast_sanitized_title}-#{@guid}.html"
  end

  def self.from_rss_feed(feed)
    Episode.new(
      guid: feed[:guid],
      title: feed[:title],
      description: feed[:description],
      author: feed[:author],
      artwork_url: feed[:artwork][:url],
      number: feed[:number],
      published_at: feed[:published_at],
      podcast_title: feed[:channel][:title],
      podcast_sanitized_title: sanitized_title(feed[:channel][:title]),
    )
  end

  def self.sanitized_title(title)
    title.gsub(" ", "-").downcase
  end
end
