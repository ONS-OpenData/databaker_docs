#!/usr/bin/env bash

# build the docs
cd ..
sphinx-build -b html databaker_docs databaker_docs/docs
cd databaker_docs

# commit and push
git add -A
git commit -m "building and pushing docs"
git push origin master
# switch branches and pull the data we want
git checkout gh-pages
rm -r *
touch .nojekyll
git checkout master docs
mv docs/* ./
rm -rf ./docs
git add -A
git commit -m "publishing updated docs..."
git push origin gh-pages

# switch back
git checkout master
