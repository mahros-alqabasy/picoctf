#!/bin/bash

# Ensure xsel is installed
if ! command -v xsel &> /dev/null; then
    echo "Error: xsel is not installed. Please install it to use clipboard copying."
	echo "Run: sudo apt update && sudo apt install -y xsel"
    exit 1
fi

output=""

# Process command-line arguments: for each argument, if it is a file, read its content; otherwise, treat it as literal text.
for arg in "$@"; do
    if [[ -f "$arg" ]]; then
        # Append file content followed by a newline
        output+=$(cat "$arg")
        output+=$'\n'
    else
        # Append the argument as literal text followed by a newline
        output+="$arg"
        output+=$'\n'
    fi
done

# Process piped or redirected input (if any) and append it.
if [ ! -t 0 ]; then
    piped=$(cat)
    if [[ -n "$piped" ]]; then
        output+="$piped"
        output+=$'\n'
    fi
fi

# Check if output is empty
if [[ -z "$output" ]]; then
    echo "WARNING: The copied text is empty."
    exit 1
fi

# Copy the combined content to the clipboard
echo -n "$output" | xsel --clipboard --input
echo "(Copied to clipboard)"
