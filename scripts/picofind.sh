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

# Function to extract the flag using the given input (stdin, file, or argument)
extract_flag() {
    local input="$1"
    grep -a -o -i -m 1 -P "$FLAG_REGEX" "$input"
}

# Check the input type
if [ -p /dev/stdin ]; then
    # Reading from stdin
    raw_flag=$(extract_flag "/dev/stdin")
elif [ -f "$1" ]; then
    # Reading from a file
    raw_flag=$(extract_flag "$1")
else
    # Treat the argument as the input
    raw_flag=$(echo "$1" | extract_flag)
fi

# Check if a flag was found
if [ -z "$raw_flag" ]; then
    echo "See to be no out of picoCTF"
    exit 1
fi

# Format the extracted flag using picoformat.sh
formatted_flag=$("$FORMAT_SCRIPT" "$raw_flag")

# Output the formatted flag
echo "$formatted_flag"
