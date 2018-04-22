#!/bin/sh
echo ""
echo "Creating new article. Please enter some information:"
echo "(Follow prompts, hitting ENTER after each entry is complete.)"
echo ""
read -p "Article Headline (Long title.): " headline
read -p "Article filename (one word to describe article): " filename
#read -p "Date of posting (Enter as YYYY-MM-dd): " date
date=`date +%Y-%m-%d`
echo ""
FILE=$date-$filename.wg     
if [ -f $FILE ]; then
   echo "Article '$FILE' already exists! Please choose a different word. Exiting..."
   exit 1
else
   echo "Creating new article '$headline' which will be saved as '$FILE' in this folder."
fi
echo "Generating data..."
echo "---
layout: post
title: $headline
date: $date 23:59:18
permalink: /$filename/
---

Replace this line of text and below with the article content.

## This will become a section heading.
1. List entry one.
2. List entry two.
3. List entry three.

### This can be used for sub-sections.

Emphasis can be done like this: *Italics* **Bold** 

**J. Freeman**
" > tempdat.txt
wordgrinder --convert tempdat.txt $FILE
rm tempdat.txt
echo "$FILE is now ready to open and modify in WORDGRINDER! Run ./publish.sh to republish all files in folder."
echo ""
