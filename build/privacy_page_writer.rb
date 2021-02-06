require_relative "./template_writer"

class PrivacyPageWriter < TemplateWriter
  def title
    "Privacy Policy - The Modern Podcast Network"
  end

  def page_name
    "privacy.html"
  end

  def template_name
    "privacy.html.erb"
  end
end
