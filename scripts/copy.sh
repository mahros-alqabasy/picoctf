#!/bin/bash

# Ensure xsel is installed
if ! command -v xsel &> /dev/null; then
    echo "Error: xsel is not installed. Please install it to use clipboard copying."
    exit 1
fi

# Read input from stdin, arguments, or file paths
if [ -p /dev/stdin ]; then
    # Case: Input is piped
    input=$(cat)
elif [[ -n "$1" ]]; then
    if [[ -f "$1" ]]; then
        # Case: Argument is a file path, read file contents
        input=$(cat "$1")
    else
        # Case: Direct text argument
        input="$*"
    fi
elif ! [ -t 0 ]; then
    # Case: Input is provided via redirection
    input=$(cat)
fi

# Check if input is empty
if [[ -z "$input" ]]; then
    echo "WARNING: The copied text is empty."
    exit 1
fi

# Copy to clipboard
echo -n "$input" | xsel --clipboard --input
echo "(Copied to clipboard)"
