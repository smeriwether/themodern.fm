require_relative "./template_writer"

class PodcastPageWriter < TemplateWriter
  def initialize(podcast)
    @podcast = podcast
  end

  def title
    "#{@podcast.title} - The Modern Podcast Network"
  end

  def meta_description
    @podcast.description
  end

  def page_name
    @podcast.url
  end

  def template_name
    "podcast.html.erb"
  end
end
