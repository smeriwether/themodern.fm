source "https://rubygems.org"

gem "jekyll", "~> 4.2.1"
gem "webrick", "~> 1.7"
gem "pry"
gem "rss", git: "https://github.com/ruby/rss.git", branch: "master"

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.15"
  gem "jekyll-postcss"
  gem "jekyll-sitemap"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]

# Fix bundler conflicts in Github Actions
gem 'concurrent-ruby', '~> 1.2', '>= 1.2.2'
gem 'listen', '~> 3.8'

