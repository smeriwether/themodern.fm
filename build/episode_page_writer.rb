require_relative "./template_writer"

class EpisodePageWriter < TemplateWriter
  def initialize(podcast, episode)
    @podcast = podcast
    @episode = episode
    @preconnect_to_host_player = true
  end

  def title
    "#{@podcast.title} Episode #{@episode.number} - The Modern Podcast Network"
  end

  def meta_description
    @episode.description
  end

  def page_name
    @episode.url
  end

  def template_name
    "episode.html.erb"
  end
end
