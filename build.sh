#!/bin/bash

rm -rf ./_data
mkdir ./_data

bundle exec ruby build/build.rb

bundle exec jekyll build
