#!/bin/bash

# Define the directory structure
MAN_DIR="man/man1"
mkdir -p "$MAN_DIR"

# Function to create and compress a man page
create_man_page() {
    local cmd_name=$1
    local description=$2
    local examples=$3

    local man_file="$MAN_DIR/${cmd_name}.1"

    cat <<EOF > "$man_file"
.TH ${cmd_name^^} 1 "$(date +'%B %Y')" "picoCTF Tools" "User Commands"
.SH NAME
$cmd_name \- $description

.SH SYNOPSIS
.B $cmd_name
[\fBSTRING\fR | \fBFILE\fR] [\fB--copy\fR]

.SH DESCRIPTION
.B $cmd_name
$description

.SH OPTIONS
.TP
\fB--copy\fR
Copy the output to the clipboard using \fBxsel\fR.

.SH EXAMPLES
.nf
$examples
.fi

.SH SEE ALSO
picofind(1), picoformat(1), picoflag(1), copy(1)

.SH AUTHOR
Written by Your Name.

.SH BUGS
Report issues at https://github.com/yourrepo/issues
EOF

    # Compress the man page
    gzip -f "$man_file"

    echo "✅ Generated and compressed: $man_file.gz"
}

# Create man pages for all commands
create_man_page "picofind" \
    "Extract the first picoCTF flag from input and format it correctly." \
    "$ picofind \"p i c o C T F {fl4g_h3r3}\" \n$ picofind challenge_output.txt"

create_man_page "picoformat" \
    "Format a picoCTF flag by removing spaces and correcting capitalization." \
    "$ picoformat \"p i C O C t F {example_flag}\""

create_man_page "picoflag" \
    "Wrap input in the picoCTF{} flag format." \
    "$ picoflag \"my_secret_flag\"\nOutput: picoCTF{my_secret_flag}"

create_man_page "copy" \
    "Copy input text to the clipboard using xsel." \
    "$ echo \"picoCTF{example_flag}\" | copy\n(Copied to clipboard)"

# Install man pages
echo "📦 Installing man pages to /usr/share/man/man1/ (requires sudo)"
sudo install -Dm644 $MAN_DIR/*.1.gz /usr/share/man/man1/

echo "✅ Man pages installed successfully."
