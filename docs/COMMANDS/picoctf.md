### **picoctf.md**  
Place this file in your docs/COMMANDS directory:

picoctf - Main dispatcher for picoCTF utility.

🔹 **Description**  
picoctf is the central controller for the picoCTF suite of tools. It dispatches commands to sub-tools such as:
- **picofind:** Extracts and formats the first picoCTF flag from input.
- **picoformat:** Formats input to remove spaces and fix capitalization.
- **picoflag:** Wraps input in the picoCTF flag format.
- **copy:** Copies text and file contents to the clipboard using xsel.

This tool simplifies usage by allowing users to run various picoCTF commands with a single entry point.

🔹 **Usage**  
```
picoctf <command> [options] [input]
```

✅ **Example 1: Display Help**  
```
$ picoctf --help
```
Displays the help message with a list of available commands.

✅ **Example 2: Extract a Flag**  
```
$ picoctf picofind "p i c o C T F {example_flag}"
```
Extracts and formats the first picoCTF flag found in the provided input.

✅ **Example 3: Copy Text and Files**  
```
$ picoctf copy "Hello World" ./file1.txt
```
Copies the literal text "Hello World" and the contents of `file1.txt` to the clipboard.

🔹 **Options**  
There is one global option:
| Option  | Description                  |
|---------|------------------------------|
| --help  | Display the help message     |

🔹 **Exit Codes**  
| Code | Meaning         |
|------|-----------------|
| 0    | Success         |
| 1    | Error occurred  |

🔹 **See Also**  
- [picoformat.md](./picoformat.md) - Format input and adjust capitalization  
- [picofind.md](./picofind.md) - Extract the first picoCTF flag from input  
- [picoflag.md](./picoflag.md) - Wrap input in the picoCTF flag format  
- [copy.md](./copy.md) - Copy text to clipboard using xsel

📌 More details at: [GitHub Repo](https://www.github.com/mahros-alqabasy/picoctf)
