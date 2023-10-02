#!/bin/sh

# reading the path of the flac files

read -p "$(echo 'Enter the full path of flac files \n>')" path

# get the total columns in the terminal

col=$(( ($(tput cols)) / 2))

# use of $ with single quotes converts the rest of string to ASCII strings

printf "\n%*s\n" $col $'Converting below files\n'

cd $path


ls *flac | while read f; do
    echo "$f"
    ffmpeg -i "$f" -acodec alac -vn "${f[@]/%flac/m4a}" < /dev/null;
done

echo "completed"
