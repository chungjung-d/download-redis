#!/bin/bash

# Install pnpm globally
npm install -g pnpm

rm -rf ./build/macos/app
# Copy app directory to build/macos
cp -r ./app ./build/macos

# Change directory to build/macos/app
cd ./build/macos/app

# Install dependencies using pnpm
npm install

# Remove .gitignore file
rm .gitignore

# Change directory back to the root
cd ../../../

# Configure global git user name and email
git config --global user.name 'Jaeyong Sung'
git config --global user.email 'buttercrab@users.noreply.github.com'

# Add all changes to git staging
git add .

# Commit changes with a message
git commit -m "[auto] build node_modules" . > /dev/null 2> /dev/null

# Loop to pull and push changes up to 3 times
for i in {1..3}; do
  git pull --rebase
  git push
  if [ $? -eq 0 ]; then
    break
  fi
  sleep 1
done