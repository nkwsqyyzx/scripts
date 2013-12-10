#!/bin/bash

if ! [[ $# == 1 ]]; then
    echo "usage: -p<PASSWORD>"
    exit
fi

password=$(echo $1|sed 's/^-p//g')
echo your password is $password

encode()
{
    file="$1"
    openssl enc -aes-256-cbc -in "$file" -out "$file".enc -pass pass:$password
}

find ./ -type f \( -iname '*\.jpg' -o -iname '*\.mov' -o -iname '*\.mp4' -o -iname '*\.png' \)|while read -r file;
do
    encode "$file"
done
