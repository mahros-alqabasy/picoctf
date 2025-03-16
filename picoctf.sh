#!/bin/bash

# Show help/manual for the tool
show_help() {
    echo "picoctf - A versatile tool for handling picoCTF flags"
    echo
    echo "Usage:"
    echo "  picoctf [COMMAND] [OPTIONS] [INPUT]"
    echo
    echo "Commands:"
    echo "  flag     Wrap input in the picoCTF flag format"
    echo "  find     Extract the first picoCTF flag from input"
    echo "  format   Format input to remove spaces and enforce correct capitalization"
    echo
    echo "Options:"
    echo "  --copy   Copy the output to the clipboard using xsel"
    echo "  --help   Display this help message and exit"
    echo
    echo "Examples:"
    echo "  picoctf flag \"example_flag\""
    echo "  echo \"example_flag\" | picoctf flag --copy"
    echo "  picoctf flag flag.txt"
    echo
    echo "  picoctf find \"p i c oCTF{example_flag}\" --copy"
    echo "  echo \"picoCTF{example_flag}\" | picoctf find"
    echo "  picoctf find file.txt"
    echo
    echo "  picoctf format \"p i co c T F {3 n h 4 n c 3 d}\" --copy"
    echo
}

# Copy output to clipboard using xsel
copy_to_clipboard() {
    if command -v xsel &> /dev/null; then
        if [[ -z "$1" ]]; then
            echo "WARNING: The copied text is empty."
            return 1
        #elif [[ ! "$1" =~ ^(?i)picoCTF{[^}]*}$ ]]; then
            # echo "WARNING: The copied text is not in picoCTF format."
		
        fi
        echo -n "$1" | xsel --clipboard --input
        echo "(Copied to clipboard)"
    else
        echo "Error: xsel is not installed. Please install it to use --copy."
        exit 1
    fi
}

# Generate a picoCTF flag
picoflag() {
    local output
    if [ -p /dev/stdin ]; then
        # Handle input from a pipeline
        while IFS= read -r line; do
            output+="picoCTF{$line}"$'\n'
        done
        echo -n "$output"
    elif [ -f "$1" ]; then
        # Handle input from a file
        while IFS= read -r line; do
            output+="picoCTF{$line}"$'\n'
        done < "$1"
        echo -n "$output"
    else
        # Handle input as a direct string
        output="picoCTF{$1}"
        echo "$output"
    fi

    # Copy to clipboard if --copy is enabled
    [[ "$COPY" == "true" ]] && copy_to_clipboard "$output"
}

# Extract the first picoCTF flag from input
picofind() {
    local output
    if [ -p /dev/stdin ]; then
        # Handle input from a pipeline
        output=$(grep -a -o -i -m 1 'picoCTF{[^}]*}')
    elif [ -f "$1" ]; then
        # Handle input from a file
        output=$(grep -a -o -i -m 1 'picoCTF{[^}]*}' "$1")
    else
        # Handle input as a direct string
        output=$(echo "$1" | grep -a -o -i -m 1 'picoCTF{[^}]*}')
    fi

    echo "$output"
    # Copy to clipboard if --copy is enabled
    [[ "$COPY" == "true" ]] && copy_to_clipboard "$output"
}

# Format input to ensure correct picoCTF capitalization and remove spaces
picoformat() {
    local output
    formatted=$(echo "$1" | tr -d '[:space:]')
    if [[ "$formatted" =~ ^[pP][iI][cC][oO][cC][tT][fF] ]]; then
        output="picoCTF${formatted:7}"
    else
        output="$formatted"
    fi

    echo "$output"
    # Copy to clipboard if --copy is enabled
    [[ "$COPY" == "true" ]] && copy_to_clipboard "$output"
}

# Main functionality dispatcher
COPY="false"
for arg in "$@"; do
    if [[ "$arg" == "--copy" ]]; then
        COPY="true"
        break
    fi
done

if [[ "$1" == "--help" || -z "$1" ]]; then
    show_help
    exit 0
fi

command=$1
shift

case $command in
    flag)
        picoflag "$@"
        ;;
    find)
        picofind "$@"
        ;;
    format)
        picoformat "$@"
        ;;
    *)
        echo "Invalid command: $command"
        echo "Use '--help' to see the available commands."
        exit 1
        ;;
esac
