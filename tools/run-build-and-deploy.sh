#!/bin/bash
# run mkdocs site in local
# prerequisites: chmod u+x <filename>

echo "=================="
echo "Building '/mkdocs/src' into '../docs' folder..."
echo "=================="

cd mkdocs
mkdocs build --clean


echo "=================="
echo "Pushing to Github.."
echo "=================="

git add -A 
git commit -m "mkdocs automated site-build-push"
git push