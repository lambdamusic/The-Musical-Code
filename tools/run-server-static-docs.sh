#!/bin/bash
# run mkdocs site in local
# prerequisites: chmod u+x <filename>

echo "=================="
echo "Running rendered /docs website ..."
echo "=================="

cd docs
python -m http.server 8002