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
    Or in Arch-based (btw) systems:  
    ```bash
    sudo pacman -S neovim neovide
    ```
## Step 2: Clone this repository
Clone this repository to the appropriate configuration directory for Neovim:  
- On Windows:  
    ```powershell
    git clone https://github.com/nhktmdzhg/nvim.git .\AppData\Local\nvim
    ```
- On Linux:  
    ```bash
    git clone https://github.com/nhktmdzhg/nvim.git ~/.config/nvim
    ```
## Step 3: Install dependencies
Ensure that you have `node.js` and `python` installed on your system. These are necessary for some of the Neovim plugins to function correctly.  
### Node.js
- On Windows: Download and install the latest release from the [official website](https://nodejs.org/)
- On Linux: You can typically install Node.js using your package manager. For example, on Debian-based systems:  
    ```bash
    sudo apt-get install nodejs npm
    ```
    Or in Arch-based (btw) systems:  
    ```bash
    sudo pacman -S nodejs npm
    ```
### Python
- On Windows: Download and install the latest release from the [official website](https://www.python.org/)
- On Linux: You can typically install Python using your package manager. For example, on Debian-based systems:  
    ```bash
    sudo apt-get install python3
    ```
    Or in Arch-based (btw) systems:  
    ```bash
    sudo pacman -S python
    ```
### Install Node.js and Python Providers for Neovim
After installing node.js and python, you need to install the providers:  
- For `node.js`:  
    + On Windows:  
    ```powershell
    npm install -g neovim
    ```
    + On Linux: 
    ```bash
    sudo npm install -g neovim
    ```
- For `python`:  
    + On Windows:  
    ```powershell
    pip install pynvim
    ```
    + On Linux: You can typically install the `pynvim` package using your package manager. For example, on Debian-based systems:  
    ```bash
    sudo apt-get install python3-pynvim
    ```
    Or in Arch-based (btw) systems:  
    ```bash
    sudo pacman -S python-pynvim
    ```
  ### Install vim-plug (package manager for vim)
- On Windows:
    ```powershell
    iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
    ```
- On Linux:
    ```bash
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
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
# References
The following are some useful resources for learning more about Neovim and the plugins used in this configuration. You can refer to these resources for more information on how to customize your Neovim setup.
- [Neovim Documentation](https://neovim.io/doc/user/)
- [vim-plug Github](https://github.com/junegunn/vim-plug)
- [CoC.nvim GitHub](https://github.com/neoclide/coc.nvim)
- [substrata.nvim GitHub](https://github.com/kvrohit/substrata.nvim)
- [bufferline.nvim GitHub](https://github.com/akinsho/bufferline.nvim)
- [NERDTree GitHub](https://github.com/preservim/nerdtree)
- [nerdtree-git-plugin GitHub](https://github.com/Xuyuanp/nerdtree-git-plugin)
- [vim-devicons GitHub](https://github.com/ryanoasis/vim-devicons)
- [vim-nerdtree-sync GitHub](https://github.com/unkiwii/vim-nerdtree-sync)
- [vim-nerdtree-syntax-highlight GitHub](https://github.com/jcharum/vim-nerdtree-syntax-highlight)
- [wilder.nvim GitHub](https://github.com/gelguy/wilder.nvim)
- [fzf GitHub](https://github.com/junegunn/fzf)
- [fzf.vim GitHub](https://github.com/junegunn/fzf.vim)
- [vim-airline GitHub](https://github.com/vim-airline/vim-airline)
- [vim-airline-themes GitHub](https://github.com/vim-airline/vim-airline-themes)
- [vim-floaterm GitHub](https://github.com/voldikss/vim-floaterm)
- [auto-pairs GitHub](https://github.com/jiangmiao/auto-pairs)
- [emmet-vim GitHub](https://github.com/mattn/emmet-vim)
- [nerdcommenter GitHub](https://github.com/preservim/nerdcommenter)
- [vim-lsp-cxx-highlight GitHub](https://github.com/jackguo380/vim-lsp-cxx-highlight)
- [java-syntax.vim GitHub](https://github.com/uiiaoo/java-syntax.vim)
- [vim-polyglot GitHub](https://github.com/sheerun/vim-polyglot)
- [semshi GitHub](https://github.com/numirias/semshi)
- [vimspector GitHub](https://github.com/puremourning/vimspector)
- [vim-fugitive GitHub](https://github.com/tpope/vim-fugitive)
- [vim-rhubarb GitHub](https://github.com/tpope/vim-rhubarb)
- [vim-gitgutter GitHub](https://github.com/airblade/vim-gitgutter)
- [vim-mergetool GitHub](https://github.com/samoshkin/vim-mergetool)
- [SimpylFold GitHub](https://github.com/tmhedberg/SimpylFold)
- [Github Copilot](https://github.com/github/copilot.vim)  
Happy coding!
