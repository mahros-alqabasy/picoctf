# picoCTF Latest Release Installation Guide

This guide will walk you through the steps to download and install the latest release of picoCTF from the repository on your Linux system.


# TEST CI/CD

## Prerequisites

Before you start, ensure that you have the following prerequisites installed on your system:

- A Linux-based OS (Ubuntu, Debian, Fedora, etc.)
- `git` to clone the repository
- `wget` or `curl` to download the release
- `tar` (if the release is packaged as a `.tar.gz` or `.tar.xz` file)
- Required dependencies for picoCTF (usually detailed in the repo's `requirements.txt` or documentation)

If you don't have `git`, `wget`, or `tar`, you can install them using the following commands:

### Install Git (if not already installed):
```bash
sudo apt-get update
sudo apt-get install git
```

### Install wget (if not already installed):
```bash
sudo apt-get install wget
```

### Install tar (if not already installed):
```bash
sudo apt-get install tar
```

## Step 1: Clone the Repository

First, you need to clone the picoCTF repository. This can be done with the following command:

```bash
git clone https://github.com/mahros-alqabasy/picoctf.git
```

Alternatively, if the repository is hosted on a different platform (e.g., GitLab, Bitbucket), use the respective URL for that repository.

```bash
git clone <repository-url>
```

Change into the directory of the cloned repo:

```bash
cd picoctf
```

## Step 2: Check for the Latest Release

### Option 1: Download the Latest Release from GitHub

If the releases are tagged in GitHub (or other Git hosting services), you can find the latest release through the "Releases" page:

1. Go to the [Releases Page](https://github.com/mahros-alqabasy/picoctf/releases) of the picoCTF repository.
2. Download the latest release. You can either download it manually through the web interface, or use the following command to get the latest release using `wget`:

```bash
wget https://github.com/mahros-alqabast/picoctf/releases/download/v<version>/picoCTF-v<version>.tar.gz
```

Replace `<version>` with the version number of the latest release. You can find the version number on the GitHub Releases page.

### Option 2: Using Git Tags (if no releases are packaged)

If the repository doesn’t have packaged releases and you only want to download the latest tagged version, you can do so by running:

```bash
git fetch --tags
git checkout tags/<latest-tag>
```

Replace `<latest-tag>` with the most recent tag name, which you can find on the GitHub tags page.

## Step 3: Install the Latest Release

Once you have downloaded the release (either by `git checkout` or direct download), you will need to extract and install the files. If you've downloaded a `.tar.gz` file, use the following command to extract it:

```bash
tar -xvzf picoCTF-v<version>.tar.gz
```

This will extract the files into a directory.

If the extracted files contain an installation script (for example `install.sh`), follow these steps to install picoCTF.

1. Change into the extracted directory:
   ```bash
   cd picoCTF-v<version>
   ```

2. Run the installation script:
   ```bash
   ./install.sh
   ```

   If `install.sh` is not provided, you may need to follow any further specific installation instructions given in the repository documentation.

## Step 4: Run picoCTF

After installation, you can typically start picoCTF by running the following command (assuming the repo has a CLI tool or script to launch the game):

```bash
./picoCTF
```

If picoCTF is installed as a service or application, follow the instructions in the documentation for starting it.

## Troubleshooting

If you run into any issues during installation or while running picoCTF, consider the following:

1. **Missing Dependencies:** Check if there are any missing dependencies. These should be documented in the repository's README or a `requirements.txt` file.
   
2. **Permissions:** Ensure that you have the correct permissions to run the installation or scripts. You might need to use `sudo` for some commands.

3. **Contact Support:** If you can't resolve the issue, check the [GitHub Issues page](https://github.com/mahros-alqabasy/picoCTF/issues) for similar problems or to ask for help.

## Conclusion

You should now have picoCTF installed and running on your Linux system. You can participate in challenges and learn more about cybersecurity and hacking in a fun, interactive way.

For more information and advanced installation options, refer to the official documentation or the repository’s README.

---

**Happy Hacking!**

### Key Sections:
1. **Prerequisites**: Lists the necessary software and tools.
2. **Step 1: Clone the Repository**: How to get the repository locally.
3. **Step 2: Download the Latest Release**: Explains how to find and download the latest release (either via GitHub or using Git tags).
4. **Step 3: Install the Release**: Instructions for extracting and installing the release.
5. **Step 4: Running picoCTF**: How to run the picoCTF instance after installation.
6. **Troubleshooting**: Provides guidance for resolving common issues.
