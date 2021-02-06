# themodern.fm

[themodern.fm](https://themodern.fm).

The Modern is a podcasting network that I'm apart of with a friend. This repo stores the tools that I built to create 
the website for the network. Building the website creates a static site that's served via nginx on a DigitalOcean droplet.

## Directory

* `/template` stores the Ruby HTML templates used to create the site's content
* `/build` stores the Ruby code used to fetch data, and turn the templates into HTML
* `/deploy` stores the deploy scripts and nginx config file

## To make changes ("build")

1. Update *something*, one of the html files, add a new public item, etc.
2. Run `npm run build`

Optional: 
Run `npm run open` to open the homepage in a web browser.


## To deploy to DigitalOcean

1. Set a `$WEBSITE_SERVER` env var to username@password of the DigitalOcean droplet
2. Make sure you can ssh into the droplet
2. Run `npm run deploy`

Note:
The website will automatically deploy when the `main` branch is updated on Github, and on the cron schedule
defined [here](https://github.com/smeriwether/themodern.fm/blob/main/.circleci/config.yml).


## Copyright & Fair Use

The content and design of this website is [copyrighted](https://www.copyright.gov/help/faq/faq-general.html#mywork). Feel 
free to ask if you want to reuse any content beyond the bounds of [fair use](https://www.copyright.gov/fair-use/more-info.html).



[![CircleCI](https://circleci.com/gh/smeriwether/themodern.fm.svg?style=svg)](https://themodern.fm)
