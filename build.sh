#!/bin/bash

rm -rf ./_data
mkdir ./_date

bundle exec ruby build/build.rb

bundle exec jekyll build
