### File: **copy.md**


copy - Copy text to clipboard using xsel.

🔹 Description  
copy is a versatile tool that allows you to copy multiple files and text strings to the clipboard using xsel. It processes each argument as follows:  
- If an argument is a file, its contents are read and appended.  
- If it’s a text string, it is taken as-is.  
- Additionally, any piped or redirected input is appended.

🔹 Usage  
```
copy [OPTIONS] [INPUT]
```

✅ Example 1: Basic Usage  
```
$ copy "some_input"
Output of copy
```

✅ Example 2: Using from File  
```
$ copy input.txt
```

✅ Example 3: Combining Strings and Files  
```
$ copy "text string" ./file1 "string" ./file2 ./file3 "another file" <<< "string from another code"
```

🔹 Options  
| Option    | Description                              |
|-----------|------------------------------------------|
| --copy    | Copy the output to clipboard           |

🔹 Exit Codes  
| Code | Meaning         |
|------|-----------------|
| 0    | Success         |
| 1    | Error occurred  |

🔹 See Also  
- README.md - General project information  
- INSTALL.md - Installation guide

📌 More details at: [GitHub Repo](https://www.github.com/mahros-alqabasy/picoctf)
