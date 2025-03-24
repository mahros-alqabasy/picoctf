
### File: **picofind.md**


picofind - Extract the first picoCTF flag from input and format it.

🔹 Description  
picofind searches for the first occurrence of a picoCTF flag pattern in the given input—whether it is provided as a file, string, or via standard input. It then formats the found flag using picoformat and prints the result.

🔹 Usage  
```
picofind [FILE | STRING] [--copy]
```

✅ Example 1: Basic Usage  
```
$ picofind "p i c o C T F {fl4g_h3r3}"
Output of picofind
```

✅ Example 2: Using from File  
```
$ picofind challenge_output.txt
```

✅ Example 3: From Standard Input  
```
$ echo "p i c o C T F {f1ag_123}" | picofind
```

🔹 Options  
| Option    | Description                                  |
|-----------|----------------------------------------------|
| --copy    | Copy the extracted flag to the clipboard      |

🔹 Exit Codes  
| Code | Meaning         |
|------|-----------------|
| 0    | Success         |
| 1    | Error occurred  |

🔹 See Also  
- README.md - General project information  
- INSTALL.md - Installation guide

📌 More details at: [GitHub Repo](https://www.github.com/mahros-alqabasy/picoctf)
