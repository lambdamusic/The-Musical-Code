#!/bin/bash
# run mkdocs site in local
# prerequisites: chmod u+x <filename>

echo "=================="
echo "Building '/mkdocs/src' into '../docs' folder..."
echo "=================="

cd mkdocs
mkdocs build --clean


echo "=================="
echo "Copying CNAME settings to '../docs' folder..."
echo "=================="

cp CNAME ../docs