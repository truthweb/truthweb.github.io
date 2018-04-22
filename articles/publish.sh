#!/bin/sh
echo "Publishing all wordgrinder files to TRUTHWEB."
read -p "Are you sure you want to do this? (y/n): " REPLY
case "$REPLY" in 
  y|Y ) echo "Yes. Initiating publishing procedure...";;
  n|N ) echo "No. Exiting..." && exit 1;;
  * ) echo "Invalid. Exiting..." && exit 1;;
esac
echo "Publishing all .wg files to _posts as .markdown files."

for article in *.wg; do
    echo "Converting $article..."
    newest=$article



done

echo "Publishing all files..."
cd ..
git add .
git commit -m "Uploading changes to articles. Latest article: $newest."
git push
