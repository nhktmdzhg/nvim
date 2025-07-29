# 🚀 Modern Neovim Configuration

<div align="center">

[![Neovim](https://img.shields.io/badge/Neovim-0.8+-57A143?style=flat-square&logo=neovim&logoColor=white)](https://neovim.io/)
[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=flat-square&logo=lua&logoColor=white)](https://www.lua.org/)
[![License](https://img.shields.io/github/license/nhktmdzhg/nvim?style=flat-square)](LICENSE)
[![Stars](https://img.shields.io/github/stars/nhktmdzhg/nvim?style=flat-square)](https://github.com/nhktmdzhg/nvim/stargazers)

_A carefully crafted Neovim configuration focused on performance, productivity, and aesthetics_

</div>

## ✨ Features

### 🎨 **User Interface**

- **Theme**: Catppuccin Mocha with beautiful color scheme
- **Statusline**: Lualine with custom components and git integration
- **Bufferline**: Clean tab-like buffer navigation with diagnostics
- **File Explorer**: Nvim-tree with floating window and natural sorting
- **Greeter**: Alpha-nvim dashboard for a welcoming start experience
- **Terminal**: Toggleterm with floating terminal interface

### 🧠 **Intelligence & Completion**

- **LSP**: COC.nvim for comprehensive language server support
- **Autocompletion**: Smart completion with tab navigation
- **Autopairs**: Automatic bracket and quote pairing
- **Emmet**: HTML/CSS expansion support
- **Commenting**: NERDCommenter for easy code commenting
- **GitHub Copilot**: AI-powered code suggestions

### 🔍 **Search & Navigation**

- **Fuzzy Finder**: FZF with Lua integration for fast file searching
- **Command Palette**: Wilder.nvim for enhanced command completion
- **File Tree**: Natural sorting with git status indicators

### 🎯 **Language Support**

- **Multi-language**: Syntax highlighting via vim-polyglot
- **C/C++**: Enhanced highlighting with vim-lsp-cxx-highlight
- **JavaScript/JSX**: Modern JS and React support
- **Python**: Optimized folding with SimpylFold
- **Web Development**: CSS, HTML, and JavaScript intelligence

### 🔄 **Git Integration**

- **Fugitive**: Comprehensive git operations
- **GitGutter**: Real-time diff indicators in sign column
- **Rhubarb**: GitHub integration for fugitive
- **Merge Tool**: Advanced conflict resolution

### ⚡ **Performance Optimizations**

- Lazy loading for faster startup
- Optimized redraw settings
- Memory-efficient plugin configuration
- Background process management

## 📋 Prerequisites

Before installing this configuration, ensure you have the following dependencies:

### Required

- **Neovim** ≥ 0.8.0
- **Git** for plugin management
- **Node.js** ≥ 16.0 (for COC.nvim)
- **Python** 3.6+ with pip

### Optional but Recommended

- **ripgrep** for faster searching
- **fd** for file finding
- **clangd** for C/C++ language server
- **Maple Mono NF CN** for better icons and ligatures

## 🚀 Installation

### 1. Install Neovim

<details>
<summary><b>📦 Linux Installation</b></summary>

#### Debian/Ubuntu

```bash
sudo apt update
sudo apt install neovim python3-neovim
```

#### Arch Linux

```bash
sudo pacman -S neovim python-pynvim
```

#### Fedora

```bash
sudo dnf install neovim python3-neovim
```

</details>

<details>
<summary><b>🪟 Windows Installation</b></summary>

Download the latest release from the [official Neovim website](https://neovim.io/), or use a package manager:

#### Using Chocolatey

```powershell
choco install neovim
```

#### Using Scoop

```powershell
scoop install neovim
```

</details>

### 2. Install Dependencies

#### Node.js and npm

<details>
<summary>Installation methods</summary>

**Linux (Ubuntu/Debian):**

```bash
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
```

**Linux (Arch):**

```bash
sudo pacman -S nodejs npm
```

**Windows:**
Download from [nodejs.org](https://nodejs.org/) or use package manager.

</details>

#### Python and pip

<details>
<summary>Installation methods</summary>

**Linux:**

```bash
# Usually pre-installed, but if needed:
sudo apt install python3 python3-pip  # Ubuntu/Debian
sudo pacman -S python python-pip      # Arch
```

**Windows:**
Download from [python.org](https://www.python.org/) or use package manager.

</details>

### 3. Install Neovim Providers

```bash
# Node.js provider
npm install -g neovim

# Python provider (choose one method)
pip install pynvim
# OR on Linux
sudo apt install python3-pynvim  # Ubuntu/Debian
sudo pacman -S python-pynvim     # Arch
```

### 4. Clone Configuration

**Linux/macOS:**

```bash
# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true

# Clone this configuration
git clone https://github.com/nhktmdzhg/nvim.git ~/.config/nvim
```

**Windows:**

```powershell
# Backup existing config (if any)
if (Test-Path "$env:LOCALAPPDATA\nvim") {
    Rename-Item "$env:LOCALAPPDATA\nvim" "$env:LOCALAPPDATA\nvim.backup"
}

# Clone this configuration
git clone https://github.com/nhktmdzhg/nvim.git "$env:LOCALAPPDATA\nvim"
```

### 6. Install Language Servers (Optional)

For enhanced language support, install COC extensions:

```vim
" Common language servers
:CocInstall coc-json coc-html coc-css coc-tsserver coc-pyright

" For C/C++ (requires clangd)
:CocInstall coc-clangd

" For more languages, see: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
```

## ⌨️ Key Mappings

### General

| Key                | Action                                  |
| ------------------ | --------------------------------------- |
| `Ctrl + A`         | Select all                              |
| `Ctrl + S`         | Save file                               |
| `Ctrl + Shift + W` | Close buffer                            |
| `Ctrl + Tab`       | Next buffer                             |
| `/\`               | Clear search highlight                  |
| `Shift + Del`      | Delete line without affecting clipboard |

### File Management

| Key         | Action               |
| ----------- | -------------------- |
| `Space + e` | Toggle file explorer |
| `Ctrl + P`  | Find files           |
| `Ctrl + F`  | Search in files      |

### Terminal

| Key        | Action                   |
| ---------- | ------------------------ |
| `Ctrl + \` | Toggle floating terminal |

### Git

| Key  | Action              |
| ---- | ------------------- |
| `]c` | Next git change     |
| `[c` | Previous git change |

## 🛠️ Customization

The configuration is modular and easy to customize:

- **Core settings**: `init.lua`
- **Plugin configurations**: `lua/settings/`
- **Theme settings**: Modify Catppuccin setup in `init.lua`
- **Keymaps**: Add custom mappings in `init.lua`

## 🧩 Plugin Overview

<details>
<summary><b>🎨 UI & Appearance</b></summary>

- **[catppuccin](https://github.com/catppuccin/nvim)** - Modern and vibrant colorscheme
- **[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)** - Buffer management with tabs
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Fast and customizable statusline
- **[alpha-nvim](https://github.com/goolord/alpha-nvim)** - Dashboard and greeter
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** - File type icons
- **[mini.icons](https://github.com/echasnovski/mini.icons)** - Additional icon support

</details>

<details>
<summary><b>📁 File Management</b></summary>

- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)** - File explorer tree
- **[fzf](https://github.com/junegunn/fzf)** - Command-line fuzzy finder
- **[fzf-lua](https://github.com/ibhagwan/fzf-lua)** - Lua-based FZF integration

</details>

<details>
<summary><b>🧠 Language & Completion</b></summary>

- **[coc.nvim](https://github.com/neoclide/coc.nvim)** - Language server client
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Auto-close brackets
- **[emmet-vim](https://github.com/mattn/emmet-vim)** - HTML/CSS expansion
- **[nerdcommenter](https://github.com/preservim/nerdcommenter)** - Easy commenting

</details>

<details>
<summary><b>🎯 Language Support</b></summary>

- **[vim-polyglot](https://github.com/sheerun/vim-polyglot)** - Multi-language pack
- **[vim-lsp-cxx-highlight](https://github.com/jackguo380/vim-lsp-cxx-highlight)** - C/C++ syntax
- **[vim-js](https://github.com/yuezk/vim-js)** - JavaScript support
- **[vim-jsx-pretty](https://github.com/MaxMEllon/vim-jsx-pretty)** - JSX syntax
- **[SimpylFold](https://github.com/tmhedberg/SimpylFold)** - Python folding

</details>

<details>
<summary><b>🔄 Git Integration</b></summary>

- **[vim-fugitive](https://github.com/tpope/vim-fugitive)** - Git wrapper
- **[vim-rhubarb](https://github.com/tpope/vim-rhubarb)** - GitHub integration
- **[vim-gitgutter](https://github.com/airblade/vim-gitgutter)** - Git diff indicators
- **[vim-mergetool](https://github.com/samoshkin/vim-mergetool)** - Merge conflict resolution

</details>

<details>
<summary><b>⚡ Utilities</b></summary>

- **[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)** - Terminal management
- **[wilder.nvim](https://github.com/gelguy/wilder.nvim)** - Command completion
- **[copilot.vim](https://github.com/github/copilot.vim)** - AI code suggestions

</details>

## 🔧 Troubleshooting

<details>
<summary><b>Common Issues</b></summary>

**Plugin installation fails:**

- Ensure you have git installed and configured
- Check internet connection
- Try `:PlugClean` then `:PlugInstall`

**COC language servers not working:**

- Install Node.js and ensure it's in PATH
- Run `:CocInfo` to check status
- Install language-specific tools (e.g., clangd for C++)

**Icons not displaying:**

- Install a Nerd Font
- Set your terminal to use the Nerd Font
- Restart terminal and Neovim

**Slow startup:**

- Check `:StartupTime` (if available)
- Disable unnecessary plugins
- Update to latest Neovim version

</details>

## 🤝 Contributing

Contributions are welcome! Please feel free to:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

Special thanks to all the plugin authors and the Neovim community for making this configuration possible.

---

<div align="center">

**⭐ Star this repository if you find it helpful!**

_Made with ❤️ for the Neovim community_

</div>
