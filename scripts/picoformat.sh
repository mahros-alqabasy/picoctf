#!/bin/bash

# Remove spaces and correct the capitalization of a picoCTF flag
input="$1"

if [[ -p /dev/stdin ]]; then
    input=$(cat -)
fi

# Remove spaces and ensure correct formatting
formatted=$(echo "$input" | tr -d '[:space:]')
if [[ "$formatted" =~ ^[pP][iI][cC][oO][cC][tT][fF] ]]; then
    output="picoCTF${formatted:7}"
else
    output="$formatted"
fi

echo "$output"
