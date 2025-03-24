#!/bin/bash

DOCS_DIR="docs"
COMMANDS_DIR="$DOCS_DIR/COMMANDS"
MANUAL_DIR="$DOCS_DIR/MANUAL"

# Ensure required directories exist
mkdir -p "$COMMANDS_DIR" "$MANUAL_DIR"

# List of commands
COMMANDS=("picofind" "picoformat" "picoflag" "copy")

# Define descriptions for each command
declare -A DESCRIPTIONS=(
    ["picofind"]="Extract the first picoCTF flag from input and format it correctly."
    ["picoformat"]="Format input by removing spaces and enforcing correct capitalization."
    ["picoflag"]="Wrap input in the picoCTF flag format."
    ["copy"]="Copy text to clipboard using xsel."
)

# Generate Markdown Docs for Each Command
for cmd in "${COMMANDS[@]}"; do
    CMD_FILE="$COMMANDS_DIR/$cmd.md"

    cat > "$CMD_FILE" <<EOF
# $cmd - ${DESCRIPTIONS[$cmd]}

## 🔹 Description
\`$cmd\` - ${DESCRIPTIONS[$cmd]}

## 🔹 Usage
\`\`\`sh
$cmd [OPTIONS] [INPUT]
\`\`\`

### **✅ Example 1: Basic Usage**
\`\`\`sh
$ $cmd "some_input"
Output of $cmd
\`\`\`

### **✅ Example 2: Using from File**
\`\`\`sh
$ $cmd input.txt
\`\`\`

## 🔹 Options
| Option  | Description |
|---------|------------|
| \`--copy\` | Copy the output to clipboard |

## 🔹 Exit Codes
| Code | Meaning |
|------|---------|
| \`0\`  | Success |
| \`1\`  | Error occurred |

## 🔹 See Also
- [README.md](../README.md) - General project information  
- [INSTALL.md](../INSTALL.md) - Installation guide  

---
📌 **More details at:** [GitHub Repo](https://github.com/yourrepo)
EOF
done

echo "✅ Markdown documentation generated in $COMMANDS_DIR"

# Generate Man Pages
for cmd in "${COMMANDS[@]}"; do
    MAN_FILE="$MANUAL_DIR/$cmd.1"

    cat > "$MAN_FILE" <<EOF
.TH $cmd 1 "$(date +%Y-%m-%d)" "picoCTF Utils" "User Commands"
.SH NAME
$cmd - ${DESCRIPTIONS[$cmd]}
.SH SYNOPSIS
.B $cmd
[\fIOPTIONS\fR] [\fIINPUT\fR]
.SH DESCRIPTION
${DESCRIPTIONS[$cmd]}
.SH OPTIONS
.TP
.B --copy
Copy the output to clipboard.
.SH EXAMPLES
.TP
.B Extract and format a flag
$cmd "p  i C O C T F {fl4g_here}"
.TP
.B Extract from a file
$cmd file.txt
.SH EXIT STATUS
.TP
.B 0
Success.
.TP
.B 1
Error occurred.
.SH SEE ALSO
.BR picoformat (1),
.BR picoflag (1)
EOF
done

echo "✅ Man pages generated in $MANUAL_DIR"

# Generate README, INSTALL, and USAGE if missing
for file in "README.md" "INSTALL.md" "USAGE.md"; do
    if [ ! -f "$DOCS_DIR/$file" ]; then
        touch "$DOCS_DIR/$file"
        echo "# $file" > "$DOCS_DIR/$file"
        echo "Placeholder content for $file" >> "$DOCS_DIR/$file"
        echo "✅ Created placeholder for $file"
    fi
done

echo "🚀 Documentation generation complete!"
