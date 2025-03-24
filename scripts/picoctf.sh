#!/bin/bash

# Main dispatcher for picoCTF utility

# Determine the directory where sub-command scripts are located
COMMANDS_DIR="/usr/bin/"

# If no command is given or --help is specified, show usage message
if [[ -z "$1" || "$1" == "--help" ]]; then
    cat <<EOF
Usage: picoctf <command> [options] [input]

Commands:
  find         		Extract the first picoCTF flag from input and format it.
  format       		Format input to remove spaces and fix capitalization.
  flag     	   		Wrap input in the picoCTF flag format.
  copy         		Copy text to clipboard using xsel.
  --help       		Show this help message.
  man <com>  		Show the man page:
					man picofind --will run man for picocfind 

EOF
    exit 0
fi

# Capture the command and shift it off the arguments list
command=$1
shift

# Check if the command script exists and is executable, then execute it with the remaining arguments
if [[ -x "$COMMANDS_DIR/$command" ]]; then
    exec "$COMMANDS_DIR/$command" "$@"
else
    echo "Error: Command '$command' not found."
    echo "Use 'picoctf --help' to see available commands."
    exit 1
fi
