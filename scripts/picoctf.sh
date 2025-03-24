#!/bin/bash

# Main dispatcher for picoCTF utility
COMMANDS_DIR="$(dirname "$0")/commands"

if [[ -z "$1" || "$1" == "--help" ]]; then
    echo "Usage: picoctf <command> [options] [input]"
    echo
    echo "Commands:"
    echo "  picofind     Extract the first picoCTF flag from input"
    echo "  picoformat   Format input to remove spaces and fix capitalization"
    echo "  picoflag     Wrap input in the picoCTF flag format"
    echo "  --help       Show this message"
    echo
    exit 0
fi

command=$1
shift

# Check if the command exists and execute it
if [[ -x "$COMMANDS_DIR/$command.sh" ]]; then
    "$COMMANDS_DIR/$command.sh" "$@"
else
    echo "Error: Command '$command' not found."
    echo "Use 'picoctf --help' to see available commands."
    exit 1
fi
