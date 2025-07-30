# 🚀 Modern Neovim Configuration

<div align='center'>

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

- **LSP**: nvim-lspconfig and mason-lspconfig for comprehensive language server support
- **Autocompletion**: Smart completion with nvim-cmp
- **Autopairs**: Automatic bracket and quote pairing
- **Commenting**: NERDCommenter for easy code commenting
- **GitHub Copilot**: AI-powered code suggestions

### 🔍 **Search & Navigation**

- **Fuzzy Finder**: FZF with Lua integration for fast file searching
- **Command Palette**: nvim-cmp for enhanced command completion
- **File Tree**: Natural sorting with git status indicators

### 🎯 **Language Support**

- **Multi-language**: Syntax highlighting via nvim-treesitter
- **Web Development**: CSS, HTML, and JavaScript intelligence

### 🔄 **Git Integration**

- **Fugitive**: Comprehensive git operations
- **GitGutter**: Real-time diff indicators in sign column
- **Rhubarb**: GitHub integration for fugitive

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
if (Test-Path '$env:LOCALAPPDATA\nvim') {
    Rename-Item '$env:LOCALAPPDATA\nvim' '$env:LOCALAPPDATA\nvim.backup'
}

# Clone this configuration
git clone https://github.com/nhktmdzhg/nvim.git '$env:LOCALAPPDATA\nvim'
```

### 6. Install Language Servers (Optional)

For enhanced language support, install COC extensions:

```vim
:MasonInstall black clang-format clangd css-lsp eslint-lsp html-lsp jedi-language-server lua-language-server luacheck prettier rust-analyzer sonarlint-language-server stylua
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
- **Plugin configurations**: `lua/settings/` and `lua/plugins/`
- **Theme settings**: Modify Catppuccin setup in `init.lua`
- **Keymaps**: Add custom mappings in `init.lua`

## 🧩 Plugin Overview

### 🎨 UI & Appearance

- [catppuccin/nvim](https://github.com/catppuccin/nvim) — Modern color scheme
- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) — Tab-style buffer management
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) — Customizable statusline
- [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim) — Startup dashboard
- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) — File icons
- [echasnovski/mini.icons](https://github.com/echasnovski/mini.icons) — Extra icon support

### 📁 File Management & Navigation

- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) — File explorer tree
- [junegunn/fzf](https://github.com/junegunn/fzf) — Fuzzy finder
- [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua) — FZF integration in Lua

### 🧠 LSP, Completion & Formatting

- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) — LSP configuration
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) — LSP/DAP manager
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) — Mason & LSPConfig integration
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) — Autocompletion engine
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
- [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [hrsh7th/cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip)
- [hrsh7th/vim-vsnip](https://github.com/hrsh7th/vim-vsnip)
- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) — Code formatter
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) — Auto pairs
- [preservim/nerdcommenter](https://github.com/preservim/nerdcommenter) — Fast code commenting
- [github/copilot.vim](https://github.com/github/copilot.vim) — AI code suggestion

### 🎯 Language & Syntax

- ['nvim-treesitter/nvim-treesitter'](https://github.com/nvim-treesitter/nvim-treesitter) — Enhanced syntax highlighting and code folding

### 🔄 Git Integration

- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) — Git wrapper
- [tpope/vim-rhubarb](https://github.com/tpope/vim-rhubarb) — GitHub integration
- [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter) — Git diff indicators
- [samoshkin/vim-mergetool](https://github.com/samoshkin/vim-mergetool) — Merge tool

### ⚡ Utilities & Terminal

- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) — Floating terminal

##

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

<div align='center'>

**⭐ Star this repository if you find it helpful!**

_Made with ❤️ for the Neovim community_

</div>
```
