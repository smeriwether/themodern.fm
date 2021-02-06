#!/bin/bash

echo "Building..."

NODE_ENV="production" ./build/build.sh

echo "Deploying..."

scp -o StrictHostKeyChecking=no -rp ./site/* $WEBSITE_SERVER:/var/www/themodern.fm
if [ $? == 1 ]; then
  echo "Deploy failed"
  exit 1
fi

scp -o StrictHostKeyChecking=no -rp ./deploy/nginx.conf $WEBSITE_SERVER:/etc/nginx/sites-enabled/themodern.fm
if [ $? == 1 ]; then
  echo "Deploy failed"
  exit 1
fi

echo "Cleaning up..."

ssh $WEBSITE_SERVER "sudo systemctl restart nginx"
if [ $? == 1 ]; then
  echo "Deploy failed"
  exit 1
fi

echo "Done!!!"
