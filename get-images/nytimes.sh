#!/bin/sh

export TODAY=$(date +%Y/%m/%d)
pdftoppm -f 1 -l 1 -r 300 "https://static01.nyt.com/images/$TODAY/nytfrontpage/scan.pdf" images/nytimes -png
convert images/nytimes-1.png -trim +repage -resize "1364x1832^" -crop 1364x1832 -gravity center -extent 1404x1872 images/nytimes.jpeg
