require "erubis"

class TemplateWriter
  def write!
    page = build_template
    page = prepare_for_production(page) if ENV["NODE_ENV"] == "production"
    file = "./site/#{page_name}"
    FileUtils.mkdir_p(File.dirname(file)) unless Dir.exists?(File.dirname(file))
    File.open(file, "w") { |file| file.puts(page) }
  end

  def title
    "The Modern - A podcast network"
  end

  def meta_description
    "The Modern is a podcast network that covers life, TV, sports, and more."
  end

  private

  def build_template
    @title = title
    @meta_description = meta_description
    @template = Erubis::EscapedEruby.new(File.read("./templates/#{template_name}")).result(binding())
    Erubis::Eruby.new(File.read("./templates/index.html.erb")).result(binding())
  end

  def prepare_for_production(page)
    updated_page = page.gsub("index.html", "/")
    updated_page.scan(/.+\.html/).each do |link|
      if !link.include?("http")
        fixed_link = link.gsub(".html", "")
        updated_page = updated_page.gsub(link, fixed_link)
      end
    end
    updated_page
  end
end
