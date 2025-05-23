# themodern.fm

[themodern.fm](https://themodern.fm) is the website for The Modern Podcast Network.

The website is a [Jekyll](https://jekyllrb.com) static site that's served via [Cloudflare Pages](https://pages.cloudflare.com/)

## Making changes

This is a [Jekyll](https://jekyllrb.com) static site. Start the server by running
`bundle exec jekyll serve`, changes are automatically picked up.

## Nightly builds

Multiple times a day we use GitHub Actions to fetch the latest podcast data from Captivate. New podcast
data is saved to this repo in the `production` branch. The `production` branch is what gets deployed to Cloudflare.

## Adding a new podcast

To add a new podcast you need to update the `build/build.rb` script. You'll need the feed URL (sometimes called
RSS Feed) and artwork for the new podcast.

## Copyright & Fair Use

The content and design of this website is [copyrighted](https://www.copyright.gov/help/faq/faq-general.html#mywork). Feel 
free to ask if you want to reuse any content beyond the bounds of [fair use](https://www.copyright.gov/fair-use/more-info.html).
