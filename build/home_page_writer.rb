require_relative "./template_writer"

class HomePageWriter < TemplateWriter
  def initialize(podcasts)
    @podcasts = podcasts
    @hide_top_navigation = true
    @latest_podcast = latest_podcast(podcasts)
    @latest_episode = @latest_podcast.episodes.first
  end

  def page_name
    "index.html"
  end

  def template_name
    "home.html.erb"
  end

  private

  def latest_podcast(podcasts)
    episodes = podcasts.map do |podcast|
      podcast.episodes
    end.flatten

    latest_episode = episodes.sort_by do |episode|
      episode.published_at
    end.last

    podcasts.each do |podcast|
      podcast.episodes.each do |episode|
        return podcast if episode == latest_episode
      end
    end
  end
end
