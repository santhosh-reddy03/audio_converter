#!/bin/sh

# reading the path of the flac files

read -p "$(echo 'Enter the full path of flac files or file\n>')" path
read -p $'Enter the full path destination folder, if not provided will place in the same folder as file\n' destination_folder

# get the total columns in the terminal

col=$(( ($(tput cols)) / 2))

# use of $ with single quotes converts the rest of string to ASCII strings

printf "\n%*s\n" $col $'Converting below files\n'


if [[ `echo $path | grep -e ".*flac$" | wc -l` -eq 1 ]];
then
    filename=`echo $path | grep -o "[^/]*flac$"`
    echo "$filename"
    if [[ -e $destination_folder ]];
        then 
        echo "destination $destination_folder "
        ffmpeg -i "$path" -acodec alac -vn "$destination_folder/${filename[@]/%flac/m4a}" < /dev/null 2>/dev/null;
    else
        ffmpeg -i "$path" -acodec alac -vn "${path[@]/%flac/m4a}" < /dev/null 2>/dev/null;
    fi
else
    cd $path
    ls *flac | while read f; do
        echo "$f"
        if [[ -e $destination_folder ]];
            then 
            echo "destination $destination_folder "
            ffmpeg -i "$f" -acodec alac -vn "$destination_folder/${f[@]/%flac/m4a}" < /dev/null 2>/dev/null;
        else
            ffmpeg -i "$f" -acodec alac -vn "${f[@]/%flac/m4a}" < /dev/null 2>/dev/null;
        fi
    done
fi

echo "completed"
