This repository contains my configuration files for Neovim.  
# Installation
## Step 1: Install Neovim
Ensure that you have Neovim installed on your system.
- On Windows:  
    Download and install the latest release from the [official website](https://neovim.io/)
- On Linux:  
    You can typically install Neovim using your package manager. For example, on Debian-based systems:  
    ```bash
    sudo apt-get install neovim neovim-qt
    ```
## Step 2: Clone this repository
Clone this repository to the appropriate configuration directory for Neovim:  
- On Windows:  
    ```bash
    git clone https://github.com/nhktmdzhg/nvim.git %APPDATA%\Local\nvim
    ```
- On Linux:  
    ```bash
    git clone https://github.com/nhktmdzhg/nvim.git ~/.config/nvim
    ```
## Step 3: Install dependencies
Ensure that you have `node.js` and `python` installed on your system. These are necessary for some of the Neovim plugins to function correctly.  
### Node.js
- On Windows and Linux: Download and install the latest release from the [official website](https://nodejs.org/)
### Python
- On Windows: Download and install the latest release from the [official website](https://www.python.org/)
- On Linux: You can typically install Python using your package manager. For example, on Debian-based systems:  
    ```bash
    sudo apt-get install python3
    ```
### Install Node.js and Python Providers for Neovim
After installing node.js and python, you need to install the providers:  
- For `node.js`:  
    ```bash
    npm install -g neovim
    ```
- For `python`:  
    + On Windows:  
    ```bash
    pip install neovim
    ```
    + On Linux: You can typically install the `pynvim` package using your package manager. For example, on Debian-based systems:  
    ```bash
    sudo apt-get install python3-pynvim
    ```
## Step 4: Start Neovim and Install Plugins
Start Neovim by running the following command:  
```bash
nvim
```
Then run the following command to install the plugins:  
```vim
:PlugInstall
```
## Step 5: Install Language Extensions for CoC
To enable autocompletion and other language features, you need to install the language extensions for CoC.
For example, to install an extension for C/C++ (you need to have `clangd` installed on your system):  
```vim
:CocInstall coc-clangd
```
You can find list of available extensions on the [CoC Extensions Wiki](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions).
# Usage
After completing the above steps, your Neovim setup should be ready to use. You can customize further according to your needs.  
# Additional Resources
- [Neovim Documentation](https://neovim.io/doc/user/)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [CoC.nvim GitHub](https://github.com/neoclide/coc.nvim)
- Some vim theme (I use tokyonight-moon on my config, you can change in init.vim): [vimcolorschemes](https://vimcolorschemes.com/)  
Happy coding!
