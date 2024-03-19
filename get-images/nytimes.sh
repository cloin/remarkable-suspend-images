#!/bin/sh

# Set the date for today's NYT front page
export TODAY=$(date +%Y/%m/%d)

# The directory where the PDF will be downloaded and the image will be saved
mkdir -p images

# Download the NYT front page PDF
echo "https://static01.nyt.com/images/$TODAY/nytfrontpage/scan.pdf"

curl -o images/nytimes.pdf "https://static01.nyt.com/images/$TODAY/nytfrontpage/scan.pdf"


# Convert the first page of the PDF to PNG using pdftoppm
pdftoppm -f 1 -l 1 -r 300 images/nytimes.pdf images/nytimes -png

# Process the PNG image with ImageMagick to fit the reMarkable tablet's screen
convert images/nytimes-1.png -trim +repage -resize "1364x1832^" -crop 1364x1832 -gravity center -extent 1404x1872 images/nytimes.png

# Clean up the downloaded PDF
rm images/nytimes.pdf
