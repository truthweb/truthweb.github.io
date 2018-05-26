#!/bin/sh
echo ""
read -p "Would you like to create a new article? (y/n): " REPLY
case "$REPLY" in 
  y|Y ) echo "Great, let's get started...";;
  n|N ) echo "No. Exiting..." && exit 1;;
  * ) echo "Invalid. Exiting..." && exit 1;;
esac
echo "Creating new article. Please enter some information:"
echo "(Follow prompts, hitting ENTER after each entry is complete.)"
echo ""
read -p "Article Headline (Long title.): " headline
read -p "Article filename (one word to describe article): " filename
#read -p "Date of posting (Enter as YYYY-MM-dd): " date
read -p "Will this be a work of fiction? (y/n): " fict
case "$fict" in 
  y|Y ) echo "Will be placed in FICTION category." && type="fiction";;
  n|N ) echo "Will be placed in NON-FICTION category." && type="non-fiction";;
  * ) echo "Invalid, saving as NON-FICTION." && type="non-fiction";;
esac
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
title: \"$headline\"
permalink: /$type/$filename
date: $date 23:59:18
categories: $type
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
