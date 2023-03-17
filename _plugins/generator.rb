require "pry"

module PodcastPagePlugin
  class PodcastPageGenerator < Jekyll::Generator
    safe true

    def generate(site)
      site.data["podcasts"].each do |podcast|
        episodes = site.data["episodes"][podcast["slug"]]
        site.pages << PodcastPage.new(site, podcast, episodes)
      end

      site.data["past_podcasts"].each do |podcast|
        episodes = site.data["past_episodes"][podcast["slug"]]
        site.pages << PodcastPage.new(site, podcast, episodes, true)
      end
    end
  end

  class PodcastPage < Jekyll::Page
    def initialize(site, podcast, episodes, retired = false)
      @site = site
      @base = site.source
      @dir  = podcast["slug"]

      @basename = @dir
      @ext      = ".html"
      @name     = @basename + @ext

      @data = {
        "episodes" => episodes["episodes"],
        "podcast" => podcast,
        "retired" => retired,
        "show_secondary_navigation" => true,
      }

      # Set the page :type, which links the page details (layout, etc) via the _config.yaml
      data.default_proc = proc do |_, key|
        site.frontmatter_defaults.find(relative_path, :podcasts, key)
      end
    end

    def url_placeholders
      {
        :podcast   => @dir,
      }
    end
  end
end

module EpisodePagePlugin
  class EpisodePageGenerator < Jekyll::Generator
    safe true

    def generate(site)
      site.data["episodes"].each do |episode_arr|
        podcast = site.data["podcasts"].find { |p| p["slug"] == episode_arr[0] }
        episode_arr[1]["episodes"].each do |episode|
          site.pages << EpisodePage.new(site, episode, podcast)
        end
      end

      site.data["past_episodes"].each do |episode_arr|
        podcast = site.data["past_podcasts"].find { |p| p["slug"] == episode_arr[0] }
        episode_arr[1]["past_episodes"].each do |episode|
          site.pages << EpisodePage.new(site, episode, podcast)
        end
      end
    end
  end

  class EpisodePage < Jekyll::Page
    def initialize(site, episode, podcast, retired = false)
      @site = site
      @base = site.source
      @dir  = episode["slug"]

      @basename = @dir
      @ext      = ".html"
      @name     = @basename + @ext

      @data = {
        "episode" => episode,
        "podcast" => podcast,
        "show_secondary_navigation" => true,
        "show_podcast_player" => true,
        "retired" => retired,
      }

      data.default_proc = proc do |_, key|
        site.frontmatter_defaults.find(relative_path, :episodes, key)
      end
    end

    def url_placeholders
      {
        :episode => @dir,
      }
    end
  end
end
