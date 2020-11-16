# BryansVimrc

![NoImage]([placeholder])
> This is the vimrc file for my setup

---

### Table of Contents

Table of Contents.
- [Description](#description)
- [How To Use](#how-to-use)
- [Contributions](#contributions)
- [License](#license)
- [Author Info](#author-info)

---

## Description

This is a way to have a vimrc file in windows that is backed up to github for source control. Some notes to think about in a windows setup when you have Vim 8.2+ installed will be found below under installation instructions.


[Back To The Top](#bryansvimrc)

---

## How To Use

#### Installation

1. Create a directory in your $HOME called “.vim” using bash. 
2. Create a file using vim called “.vimrc” in the $HOME directory.
This is called your “user vimrc” file and it overrides the _vimrc file stored in the
$VIM directory.

    In the “$HOME/.vimrc” file you only want to say one thing: 
    ```html
    “source $HOME/.vim/_vimrc” 
    ```
    which points to a file in the next step.

3. Create your real “_vimrc” file in the “$HOME/.vim” folder using vim which will contain the "real" vimrc settings that you want to use. 

    Now that you have that setup, you can save the file with git in that folder with a readme and any other helpful files. 

Credit to [RomainL](https://github.com/romainl/idiomatic-vimrc) for the original idea.


---


## Contributions

I am currently not accepting contributions to this project, however feel free to leave comments on the issues tab of this project for consideration.

<br/>

### Project Status

The current status of this project is in development. 

[Back To The Top](#bryansvimrc)

---

## License

<mitlicense>
Copyright &copy; [2020] [Bryan Lundeen] 
<br/><br/>
MIT License
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: 
<br/><br/>
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. 
<br/><br/>
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
<br/><br/>
<mitlicense>


[Back To The Top](#bryansvimrc)

---

## Author Info

- Github - [lundeen-bryan](https://github.com/lundeen-bryan)
- LinkedIn - [BryanLundeen](https://www.linkedin.com/in/bryanlundeen/)
- Twitter – [@LundeenBryan](https://twitter.com/LundeenBryan)	
- Facebook – [realbryanlundeen](https://www.facebook.com/realbryanlundeen)

[Back To The Top](#bryansvimrc)

