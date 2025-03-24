#!/bin/bash

# Wrap input inside picoCTF{} flag format
if [ -p /dev/stdin ]; then
    while IFS= read -r line; do
        echo "picoCTF{$line}"
    done
elif [ -f "$1" ]; then
    while IFS= read -r line; do
        echo "picoCTF{$line}"
    done < "$1"
else
    echo "picoCTF{$1}"
fi
