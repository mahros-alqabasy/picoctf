
### File: **picoflag.md**

picoflag - Wrap input in the picoCTF{} format.

🔹 Description  
picoflag wraps the provided input by adding "picoCTF{" at the beginning and "}" at the end, ensuring the input follows the proper flag format.  
It processes input from arguments, files, or standard input.

🔹 Usage  
```
picoflag [OPTIONS] [INPUT]
```

✅ Example 1: Basic Usage  
```
$ picoflag "my_secret_flag"
picoCTF{my_secret_flag}
```

✅ Example 2: Using from File  
```
$ picoflag secret.txt
```

✅ Example 3: From Standard Input  
```
$ echo "flag_content" | picoflag
```

🔹 Options  
| Option    | Description                                       |
|-----------|---------------------------------------------------|
| --copy    | Copy the generated flag to the clipboard using xsel |

🔹 Exit Codes  
| Code | Meaning         |
|------|-----------------|
| 0    | Success         |
| 1    | Error occurred  |

🔹 See Also  
- README.md - General project information  
- INSTALL.md - Installation guide

📌 More details at: [GitHub Repo](https://www.github.com/mahros-alqabasy/picoctf)