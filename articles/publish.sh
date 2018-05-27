#!/bin/sh
echo "Publishing all wordgrinder files to TRUTHWEB."
read -p "Are you sure you want to do this? (y/n): " REPLY
case "$REPLY" in 
  y|Y ) echo "Yes. Initiating publishing procedure...";;
  n|N ) echo "No. Exiting..." && exit 1;;
  * ) echo "Invalid. Exiting..." && exit 1;;
esac
echo "Publishing all .wg files to _posts as .markdown files."
echo "Purging _posts folder..."
cd ~/truthweb.github.io
rm -rf _posts
mkdir _posts
cd ~/truthweb.github.io/articles

for article in *.wg; do
    newest=$article
    filename="${article%.*}"
    echo ""
    echo "Converting $filename to an article."
    wordgrinder --convert $article temp.txt
    sed -i $'s/[^[:print:]\t]//g' temp.txt
    iconv -f utf-8 -t utf-8 -c -o temp.txt temp.txt
    mv temp.txt ~/truthweb.github.io/_posts/$filename.markdown
    echo "Moved file to _posts."
done

echo ""
echo "Publishing all files..."
cd ..
echo "Uploading changes to articles. Latest article: $newest."
git add .
git commit -m "Uploading changes to articles. Latest article: $newest."
git push
