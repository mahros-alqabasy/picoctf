
### File: **picoformat.md**


picoformat - Format a picoCTF flag correctly.

🔹 Description  
picoformat ensures proper capitalization and removes spaces from a picoCTF flag, normalizing it to the expected format.  
It accepts input either as a direct argument or from standard input.

🔹 Usage  
```
picoformat [OPTIONS] [INPUT]
```

✅ Example 1: Basic Usage  
```
$ picoformat "p i C O C t F {example_flag}"
Output of picoformat
```

✅ Example 2: From File Input  
```
$ picoformat flag_input.txt
```

🔹 Options  
| Option    | Description                                   |
|-----------|-----------------------------------------------|
| --copy    | Copy the formatted flag to the clipboard      |

🔹 Exit Codes  
| Code | Meaning         |
|------|-----------------|
| 0    | Success         |
| 1    | Error occurred  |

🔹 See Also  
- README.md - General project information  
- INSTALL.md - Installation guide

📌 More details at: [GitHub Repo](https://www.github.com/mahros-alqabasy/picoctf)
