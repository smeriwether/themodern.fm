#!/bin/bash

rm -rf ./site

npx postcss --config ./build/postcss.config.js ./build/styles.css -o ./site/styles.css

ruby ./build/main.rb

if [[ $NODE_ENV == "production" ]]; then
  for file in ./site/*.html; do
    mv -- "$file" "${file%%.html}"
  done
fi

cp -R ./public ./site

mv ./site/public/robots.txt ./site/robots.txt
