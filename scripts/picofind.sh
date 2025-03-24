#!/bin/bash

# Extract and format the first picoCTF flag from input

# Ensure picoformat is available
SCRIPT_DIR="$(dirname "$0")"
FORMAT_SCRIPT="$SCRIPT_DIR/picoformat"

if [ -p /dev/stdin ]; then
    raw_flag=$(grep -a -o -i -m 1 -P 'p\s*i\s*c\s*o\s*C\s*T\s*F\s*\{[^}]*\}')
elif [ -f "$1" ]; then
    raw_flag=$(grep -a -o -i -m 1 -P 'p\s*i\s*c\s*o\s*C\s*T\s*F\s*\{[^}]*\}' "$1")
else
    raw_flag=$(echo "$1" | grep -a -o -i -m 1 -P 'p\s*i\s*c\s*o\s*C\s*T\s*F\s*\{[^}]*\}')
fi

# Format the extracted flag using picoformat.sh
formatted_flag=$("$FORMAT_SCRIPT" "$raw_flag")

echo "$formatted_flag"
