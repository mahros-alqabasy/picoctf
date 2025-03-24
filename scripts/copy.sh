#!/bin/bash

# Copy input to clipboard using xsel
if command -v xsel &> /dev/null; then
    if [[ -z "$1" ]]; then
        echo "WARNING: The copied text is empty."
        exit 1
    fi
    echo -n "$1" | xsel --clipboard --input
    echo "(Copied to clipboard)"
else
    echo "Error: xsel is not installed. Please install it to use clipboard copying."
    exit 1
fi
