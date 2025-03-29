#!/bin/bash

# Ensure picoformat is available
FORMAT_SCRIPT="/usr/bin/picoformat"

# Regular expression to match picoCTF flag pattern
FLAG_REGEX='p\s*i\s*c\s*o\s*C\s*T\s*F\s*\{[^}]*\}'

# Check if picoformat script exists
if [ ! -x "$FORMAT_SCRIPT" ]; then
    echo "Error: picoformat script not found at $FORMAT_SCRIPT"
    exit 1
fi

# Function to extract the flag from input
extract_flag() {
    grep -a -o -i -m 1 -P "$FLAG_REGEX"
}

# Determine input source
if [ -p /dev/stdin ]; then
    # Read from pipe
    raw_flag=$(extract_flag < /dev/stdin)
elif [ -f "$1" ]; then
    # Read from a file
    raw_flag=$(extract_flag < "$1")
elif [ -n "$1" ]; then
    # Read from an argument
    echo "$1" | extract_flag
else
    echo "Usage: echo 'string' | picofind OR picofind file.txt OR picofind 'text'"
    exit 1
fi

# Check if a flag was found
if [ -z "$raw_flag" ]; then
    echo "Seems to be no picoCTF flag found"
    exit 1
fi

# Format the extracted flag using picoformat
formatted_flag=$("$FORMAT_SCRIPT" <<< "$raw_flag")

# Output the formatted flag
echo "$formatted_flag"
