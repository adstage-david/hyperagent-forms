#!/bin/bash

set -e

mkdir -p _includes/
for file in README CONTRIBUTING INSTALL; do
  git show master:${file}.md > _includes/${file}.md
done

for dir in dist; do
  rm -rf $dir
  git checkout master -- $dir
done

bundle
bundle exec compass compile --relative-assets --force
bundle exec jekyll build
