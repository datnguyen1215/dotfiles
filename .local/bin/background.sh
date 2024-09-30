#!/bin/bash

# if $1 is not provided
if [ -z $1 ]; then
    echo "Usage: $0 <background_folder>"
    exit 1
fi

pkill -f feh

while true; do
    for i in $1/*; do
        feh --bg-scale $i
        sleep 15
    done
done
