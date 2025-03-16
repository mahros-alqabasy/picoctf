# picoctf - A Versatile Tool for Handling picoCTF Flags

Created by **Mahros Alqabay**

---

## Installation

### Clone the Repository and Install the Tool Globally

~~~bash
git clone https://github.com/mahros-alqabay/picoctf-tool.git
cd picoctf-tool
chmod +x picoctf
sudo mv picoctf /usr/local/bin/
~~~

---

## Usage

Run the tool using the **picoctf** command followed by a subcommand. Available subcommands are: `flag`, `find`, `format`.

---

## Commands

### Wrap a Flag (`flag`)

Wrap the input in the `picoCTF{}` format.

#### Examples:

**From a direct string:**

~~~bash
picoctf flag "example_flag"
~~~

**Output:**

~~~bash
picoCTF{example_flag}
~~~

**From a file:**

~~~bash
picoctf flag file.txt
~~~

**From a pipeline:**

~~~bash
echo "example_flag" | picoctf flag
~~~

---

### Find a Flag (`find`)

Extract the first `picoCTF{...}` flag from the input.

#### Examples:

**From a direct string:**

~~~bash
picoctf find "random text picoCTF{flag}"
~~~

**From a file:**

~~~bash
picoctf find file.txt
~~~

**From a pipeline:**

~~~bash
cat file.txt | picoctf find
~~~

---

### Format Input (`format`)

Format input text by removing spaces and normalizing capitalization for the picoCTF format.

#### Examples:

~~~bash
picoctf format "p i c oCT F {example_flag}"
~~~

---

### Copy to Clipboard (`--copy`)

Add `--copy` to any command to automatically copy the output to the clipboard.

#### Examples:

~~~bash
picoctf find file.txt --copy
picoctf flag "example_flag" --copy
~~~

If the output is invalid (e.g., empty or not in `picoCTF{...}` format), you will receive a warning:

WARNING: The copied text is empty. WARNING: The copied text is not in picoCTF format.


---

## Examples

#### Wrapping a Flag

~~~bash
picoctf flag "example_flag"
~~~

**Output:**

~~~bash
picoCTF{example_flag}
~~~

#### Extracting a Flag

~~~bash
picoctf find file.txt
~~~

**Output:**

~~~bash
picoCTF{flag_from_file}
~~~

#### Formatting Input

~~~bash
picoctf format "P I C OCTF{EXAMPLE_FLAG}"
~~~

**Output:**

~~~bash
picoCTF{EXAMPLE_FLAG}
~~~

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## Author

Created by Mahros Alqabay

Follow me on GitHub.

---

## Final Remarks

This README file is formatted to be both professional and informative. It covers all essential aspects, including installation, usage, commands with examples, and licensing. Such documentation follows best practices outlined in the [GitHub Documentation](https://docs.github.com) and adheres to open-source guidelines defined by the [MIT License](https://opensource.org/licenses/MIT). For more insights and inspiration regarding CTF challenges, refer to the [picoCTF official website](https://picoctf.org).

---

### References

1. [GitHub Documentation](https://docs.github.com)  
2. [MIT License](https://opensource.org/licenses/MIT)  
3. [picoCTF](https://picoctf.org)
