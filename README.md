# BRYANS_VIMRC

![NoImage]([placeholder])

> This is the vimrc file for my setup

---

**Table of Contents**

<!-- TOC -->

- [Description](#description)
- [How To Use](#how-to-use)
  - [Installation](#installation)
- [Plugins and Extensions](#plugins-and-extensions)
  - [Notes about Plugins](#notes-about-plugins)
  - [About dos2unix](#about-dos2unix)
- [Contributions](#contributions)
  - [Project Status](#project-status)
- [License](#license)
- [Author Info](#author-info)

<!-- /TOC -->

---

## Description

This is a way to have a vimrc file in windows that is backed up to github for source control. Some notes to think about in a windows setup when you have Vim 8.2+ installed will be found below under installation instructions.

[Back To The Top](#bryans_vimrc)

---

## How To Use

### Installation

**Note**: if you already have a vim setup or it is configured in some other way, then I suggest you make a backup copy before proceeding.

1. **Initialize Directory**: Create a directory in your `$HOME` named `.vim`:

   ```bash
   mkdir ~/.vim
   ```
2. **User Vimrc File**: Navigate to your `$HOME` directory and create a `.vimrc` file. This will be your "user vimrc" file:

   ```bash
   cd ~
   touch .vimrc
   ```

   Open this `.vimrc` in Vim or any text editor. Add the following line to make it source the "real" `_vimrc` file you'll create next:

   ```vim
   source $HOME/.vim/_vimrc
   ```
3. **Main Vimrc Configuration**: Navigate to the `.vim` directory you created in step 1 and create the `_vimrc` file:

   ```bash
   cd ~/.vim
   touch _vimrc
   ```

   This `_vimrc` will be the main configuration file where all your Vim settings reside. You can now start customizing this file as you wish.
4. **Backup with Git**: Now that your Vim configuration is in place, you can initialize a Git repository in the `.vim` directory and push it to GitHub or another platform:

   ```bash
   cd ~/.vim
   git init
   git add .
   git commit -m "Initial vim configuration"
   ```

   Don't forget to add a remote repository and push your changes:

   ```bash
   git remote add origin [Your-Repository-URL]
   git push -u origin master
   ```

Credit to [RomainL](https://github.com/romainl/idiomatic-vimrc) for the original idea.

[Back To The Top](#bryans_vimrc)

---

## Plugins and Extensions

| Plugin Name    | Description                                                | Web URL                                               |
| -------------- | ---------------------------------------------------------- | ----------------------------------------------------- |
| `CSApprox`   | Makes Vim's GUI colors available in terminal Vim.          | [GitHub Link](https://github.com/godlygeek/csapprox)     |
| `emmet-vim`  | Provides support for the Emmet web development tool.       | [GitHub Link](https://github.com/mattn/emmet-vim)        |
| `nerdtree`   | A tree explorer plugin for Vim.                            | [GitHub Link](https://github.com/preservim/nerdtree)     |
| `vim-gist`   | Allows you to work with Gists on GitHub directly from Vim. | [GitHub Link](https://github.com/mattn/vim-gist)         |
| `webapi-vim` | Allows Vim to interact with web APIs.                      | [GitHub Link](https://github.com/mattn/webapi-vim)       |
| `git-open  ` | Allows user to open git repo of selected module.           | [GitHub Link](https://github.com/lundeen-bryan/git-open) |
| `dos2unix`   | Helps convert between DOS and Unix file formats.           | *[See notes below](#about-dos2unix)                      |

### Notes about Plugins

Some plugins didn't work in this config such as CamelCaseMotion, prettier-vim, and pandoc-vim.

### About dos2unix

The `dos2unix` plugin is an essential tool for those working across both DOS/Windows and Unix-like environments. It's dedicated to converting line endings from the DOS format (CR+LF) to the Unix format (LF) and vice versa. This becomes crucial when handling files across different systems to ensure consistency and prevent unexpected behaviors in scripts or applications. The exe files are stored in C:/Tools/.

To view line endings in vim, use the `:set list` command to see line endings appear as "$" and to toggle it back use `:set nolist.`

For more detailed information:

- Check out the project on [SourceForge](https://sourceforge.net/projects/dos2unix/).
- Dive into the [Author&#39;s Changelog](https://dos2unix.sourceforge.io/) for a deeper understanding of its development and version history.
- For insights on how line endings impact Vim and other helpful tools related to file formats, the [Vim Wiki](https://vim.fandom.com/wiki/File_format#Tools) is an invaluable resource.

### A Note About Using VIM in Cmder

When you are in Cmder and open a windows bash terminal, then open a file in VIM, the configuration in bash doesn't work right and the screen will appear to be blank.

The issue was [reported](https://github.com/Maximus5/ConEmu/issues/653) and it turns out that you can only run vim when you are in the minty version of Bash.


[Back To The Top](#bryans_vimrc)

---

## Contributions

I am currently not accepting contributions to this project, however feel free to leave comments on the issues tab of this project for consideration.

### Project Status

The current status of this project is in development.

[Back To The Top](#bryans_vimrc)

---

## License

<mitlicense>
Copyright © [2020] [Bryan Lundeen]
<br/><br/>
MIT License
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
<br/><br/>
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
<br/><br/>
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
<br/><br/>
<mitlicense>

[Back To The Top](#bryans_vimrc)

---

## Author Info

- Github - [lundeen-bryan](https://github.com/lundeen-bryan)
- LinkedIn - [BryanLundeen](https://www.linkedin.com/in/bryanlundeen/)
- Twitter – [@LundeenBryan](https://twitter.com/LundeenBryan)
- Facebook – [realbryanlundeen](https://www.facebook.com/realbryanlundeen)

[Back To The Top](#bryans_vimrc)
