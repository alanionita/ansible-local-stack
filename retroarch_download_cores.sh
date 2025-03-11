#!/bin/bash

URL="https://buildbot.libretro.com/nightly/android/latest/arm64-v8a/"
OUTPUT_DIR="retroarch_cores"  # Change this to your desired directory

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

echo "Downloading files to directory: $OUTPUT_DIR"

# Fetch directory listing and extract file URLs
curl -s "$URL" | grep 'class="fb-n"' | grep -o 'href="[^"]*"' | sed 's/href="//; s/"$//' | while read -r href; do
    # Skip Parent Directory link
    if [[ "$href" != ".." ]]; then
	echo "href - $href"
        full_url="https://buildbot.libretro.com$href"
        filename=$(basename "$href")
        echo "Downloading: $filename"
        curl -s -o -# "$OUTPUT_DIR/$filename" "$full_url"
    fi
done

echo "Download complete. Files saved to: $OUTPUT_DIR"
