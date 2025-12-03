# 🚀 Modern Neovim Configuration

<div align='center'>

[![Neovim](https://img.shields.io/badge/Neovim-0.8+-57A143?style=flat-square&logo=neovim&logoColor=white)](https://neovim.io/)
[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=flat-square&logo=lua&logoColor=white)](https://www.lua.org/)
[![License](https://img.shields.io/github/license/nhktmdzhg/nvim?style=flat-square)](LICENSE)
[![Stars](https://img.shields.io/github/stars/nhktmdzhg/nvim?style=flat-square)](https://github.com/nhktmdzhg/nvim/stargazers)

_ミツキナノカ's carefully crafted Neovim configuration focused on performance, productivity, and aesthetics_

</div>

## ✨ Features

### 🎨 **Beautiful User Interface**

- **Theme**: Catppuccin Mocha with terminal color integration and Mason UI theming
- **Dashboard**: Custom Alpha-nvim start screen with ミツキナノカ ASCII art and personalized footer
- **Statusline**: Lualine with custom mode display, Git integration, and "ミツキナノカ" branding
- **Bufferline**: Enhanced buffer tabs with LSP diagnostics and smart filtering (hides terminal buffers)
- **File Explorer**: Floating NvimTree with natural sorting, Git status indicators, and smart window management
- **Terminal**: ToggleTerm with floating interface, curved borders, and auto-sizing

### 🧠 **AI-Powered Development**

- **GitHub Copilot**: Intelligent code completion with auto-trigger for multiple file types
- **LSP Integration**: Comprehensive language server support via nvim-lspconfig and Mason
- **Smart Completion**: nvim-cmp with multiple sources (LSP, buffer, path, cmdline)
- **Auto Formatting**: Conform.nvim with pre-configured formatters for 10+ languages
- **Autopairs**: Smart bracket and quote pairing with nvim-autopairs

### 🔍 **Powerful Search & Navigation**

- **Telescope**: Fuzzy finder with FZF native integration and UI-select extension
- **Search & Replace**: Muren.nvim for powerful multi-file search and replace operations
- **File Navigation**: Enhanced file exploration with natural sorting and Git integration
- **Command Enhancement**: Smart command-line completion with path and buffer sources

### � **Advanced Language Support**

- **Treesitter**: Syntax highlighting for 25+ languages with automatic parser installation
- **LSP Servers**: Pre-configured for Lua, C/C++, Python, Rust, HTML, CSS, JavaScript/TypeScript
- **Code Formatting**: Stylua, Black, Prettier, Clang-format, and Rustfmt integration
- **Markdown**: Enhanced rendering with render-markdown.nvim for better documentation experience

### 🔄 **Git Integration**

- **GitSigns**: Real-time Git status in sign column with current line blame
- **Buffer Integration**: Git status indicators in file explorer and statusline
- **Performance**: Optimized Git operations with configurable timeouts

### ⚡ **Performance Optimizations**

- **Lazy Loading**: Strategic plugin loading for faster startup times
- **Large File Handling**: Automatic optimizations for files larger than 1MB
- **Memory Management**: Optimized regex patterns and syntax highlighting limits
- **Background Processes**: Efficient file watching and auto-reload functionality

## 📋 Prerequisites

**Required Dependencies:**

- **Neovim** ≥ 0.9.0
- **Git** for plugin management and version control
- **Node.js** ≥ 16.0 for LSP servers and language tools
- **Python** 3.6+ with pip for Python-based tools
- **Make** for building telescope-fzf-native extension

**Optional but Recommended:**

- **ripgrep** for faster text searching in Telescope
- **fd** for enhanced file finding capabilities
- **A Nerd Font** for proper icon display (recommended: JetBrains Mono Nerd Font)

## 🚀 Installation

### Quick Setup

**Linux/macOS:**

```bash
# Backup existing configuration
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true

# Clone this configuration
git clone https://github.com/nhktmdzhg/nvim.git ~/.config/nvim

# Start Neovim (plugins will auto-install)
nvim
```

**Windows:**

```powershell
# Backup existing config
if (Test-Path '$env:LOCALAPPDATA\nvim') {
    Rename-Item '$env:LOCALAPPDATA\nvim' '$env:LOCALAPPDATA\nvim.backup'
}

# Clone configuration
git clone https://github.com/nhktmdzhg/nvim.git '$env:LOCALAPPDATA\nvim'

# Start Neovim
nvim
```

### Post-Installation

1. **First Launch**: Lazy.nvim will automatically install all plugins
2. **LSP Setup**: Language servers will be auto-configured via Mason
3. **Treesitter**: Parsers will be installed automatically for supported languages
4. **GitHub Copilot**: Run `:Copilot auth` to authenticate (requires GitHub account)

## ⌨️ Key Bindings

### 🌟 **Global Shortcuts**

| Key      | Mode          | Action       | Description                         |
| -------- | ------------- | ------------ | ----------------------------------- |
| `Space`  | Normal        | Leader key   | Primary leader for custom commands  |
| `\`      | Normal        | Local leader | Secondary leader for local commands |
| `Ctrl+S` | Normal/Insert | Save file    | Quick save current buffer           |
| `Ctrl+A` | Normal/Insert | Select all   | Select entire buffer content        |
| `/\`     | Normal        | Clear search | Remove search highlighting          |

### 📁 **File & Buffer Management**

| Key            | Mode   | Action              | Description                           |
| -------------- | ------ | ------------------- | ------------------------------------- |
| `F5`           | Normal | Toggle NvimTree     | Show/hide floating file explorer      |
| `F6`           | Normal | Reload NvimTree     | Refresh file explorer content         |
| `F7`           | Normal | Open Telescope      | Launch fuzzy finder menu              |
| `Ctrl+Tab`     | Normal | Next buffer         | Navigate to next buffer tab           |
| `Ctrl+Shift+W` | Normal | Close buffer        | Close current buffer tab              |
| `<leader>bd`   | Normal | Smart buffer delete | Close buffer preserving window layout |

### 🔧 **Development Tools**

| Key            | Mode   | Action            | Description                  |
| -------------- | ------ | ----------------- | ---------------------------- |
| `Ctrl+Shift+F` | Any    | Format code       | Auto-format current buffer   |
| `Ctrl+F`       | Normal | Search & Replace  | Open Muren search/replace UI |
| `Ctrl+Shift+P` | Any    | Toggle Markdown   | Preview markdown rendering   |
| `F9`           | Normal | Floating Terminal | Open/close terminal window   |
| `Ctrl+K`       | Normal | Kill buffer       | Force close current buffer   |

### ✏️ **Editing Enhancements**

| Key         | Mode          | Action                  | Description                                  |
| ----------- | ------------- | ----------------------- | -------------------------------------------- |
| `Tab`       | Insert        | Next completion         | Navigate to next completion item             |
| `Shift+Tab` | Insert        | Previous completion     | Navigate to previous completion item         |
| `Enter`     | Insert        | Confirm completion      | Accept selected completion                   |
| `Shift+Del` | Normal/Insert | Delete line (safe)      | Delete line without affecting clipboard      |
| `Del`       | Visual        | Delete selection (safe) | Delete selection without affecting clipboard |

### 🖥️ **Terminal Controls**

| Key   | Mode     | Action          | Description                    |
| ----- | -------- | --------------- | ------------------------------ |
| `Esc` | Terminal | Normal mode     | Exit terminal insert mode      |
| `F9`  | Terminal | Toggle terminal | Close/reopen floating terminal |

## 🛠️ Plugin Configuration

### 🎨 **UI & Theme Plugins**

| Plugin              | Purpose       | Configuration Highlights                               |
| ------------------- | ------------- | ------------------------------------------------------ |
| **catppuccin/nvim** | Color scheme  | Mocha flavor, terminal colors, Mason integration       |
| **alpha-nvim**      | Start screen  | Custom ミツキナノカ ASCII art, personalized dashboard  |
| **lualine.nvim**    | Status line   | Custom mode display, Git info, global statusline       |
| **bufferline.nvim** | Buffer tabs   | LSP diagnostics, terminal filtering, natural sorting   |
| **nvim-tree.lua**   | File explorer | Floating window, Git integration, natural file sorting |

### 🧠 **Development & LSP**

| Plugin             | Purpose         | Configuration Highlights                                                         |
| ------------------ | --------------- | -------------------------------------------------------------------------------- |
| **nvim-lspconfig** | LSP client      | Pre-configured servers: lua_ls, clangd, jedi, rust_analyzer, html, eslint, cssls |
| **mason.nvim**     | LSP manager     | Rounded borders, custom icons, automatic server management                       |
| **nvim-cmp**       | Completion      | Multi-source completion (LSP, buffer, path, cmdline)                             |
| **copilot.lua**    | AI completion   | Auto-trigger, multi-filetype support, enhanced suggestions                       |
| **conform.nvim**   | Code formatting | Stylua, Black, Prettier, Clang-format with custom arguments                      |

### 🔍 **Search & Navigation**

| Plugin             | Purpose          | Configuration Highlights                                            |
| ------------------ | ---------------- | ------------------------------------------------------------------- |
| **telescope.nvim** | Fuzzy finder     | FZF integration, UI-select, optimized layout (95% width/90% height) |
| **muren.nvim**     | Search & replace | Advanced multi-file search and replace capabilities                 |
| **gitsigns.nvim**  | Git integration  | Current line blame, diff indicators, background updates             |

### � **Language & Syntax**

| Plugin                   | Purpose             | Configuration Highlights                                      |
| ------------------------ | ------------------- | ------------------------------------------------------------- |
| **nvim-treesitter**      | Syntax highlighting | 25+ languages, auto-install, enhanced folding and indentation |
| **render-markdown.nvim** | Markdown rendering  | Enhanced markdown display with block-width code rendering     |

### ⚡ **Utilities**

| Plugin              | Purpose      | Configuration Highlights                                        |
| ------------------- | ------------ | --------------------------------------------------------------- |
| **toggleterm.nvim** | Terminal     | Floating terminal with curved borders, auto-sizing (80% screen) |
| **nvim-autopairs**  | Auto pairing | Smart bracket and quote completion                              |
| **mini.comment**    | Commenting   | Intelligent code commenting                                     |
| **mini.icons**      | File icons   | Consistent iconography across all UI components                 |

## 📁 Configuration Structure

```
~/.config/nvim/
├── init.lua                    # � Main configuration with performance optimizations
├── lazy-lock.json             # 🔒 Plugin version lockfile for reproducible installs
├── README.md                   # 📖 This comprehensive documentation
└── lua/plugins/                # 📦 Modular plugin configurations
    ├── alpha.lua               # 🎨 Custom start screen with ミツキナノカ theme
    ├── bufferline.lua          # 📑 Enhanced buffer tabs with diagnostics
    ├── conform.lua             # 🔧 Multi-language code formatting
    ├── copilot.lua             # 🤖 GitHub Copilot AI integration
    ├── gitsigns.lua            # 📊 Git status and blame information
    ├── lspconfig.lua           # 🔌 Language server configurations
    ├── lualine.lua             # 📏 Customized status line
    ├── mason.lua               # 🛠️ LSP server management
    ├── muren.lua               # 🔍 Advanced search and replace
    ├── nvim-cmp.lua            # ⚡ Intelligent auto-completion
    ├── nvim-tree.lua           # 🌳 Feature-rich file explorer
    ├── render_markdown.lua     # 📝 Enhanced markdown rendering
    ├── telescope.lua           # 🔭 Powerful fuzzy finder
    ├── toggleterm.lua          # 💻 Floating terminal integration
    └── treesitter.lua          # 🌈 Advanced syntax highlighting
```

## 🔧 Customization Guide

### 🎨 **Personalizing the Theme**

```lua
-- In init.lua, modify Catppuccin setup:
opts = {
    flavour = 'mocha',          -- latte, frappe, macchiato, mocha
    term_colors = true,         -- Enable terminal colors
    integrations = {
        mason = true,           -- Mason UI integration
        copilot_vim = true,     -- Copilot integration
    },
},
```

### ⌨️ **Adding Custom Key Bindings**

```lua
-- Add to init.lua after existing keymaps:
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<your-key>', '<your-command>', opts)
```

### 🔌 **Adding New Plugins**

Create a new file in `lua/plugins/` or add to existing plugin specs:

```lua
return {
    'author/plugin-name',
    lazy = true,
    event = 'VeryLazy',  -- or other lazy loading triggers
    opts = {
        -- plugin configuration
    },
}
```

### 🛠️ **Modifying LSP Settings**

Edit `lua/plugins/lspconfig.lua` to add new language servers:

```lua
local servers = {
    'lua_ls',
    'clangd',
    -- Add your new server here
    'your_language_server',
}
```

## 🤝 Contributing

This configuration is open for community contributions! Here's how you can help:

### 🐛 **Bug Reports**

- Check existing issues before creating new ones
- Provide detailed reproduction steps
- Include your system information and Neovim version

### ✨ **Feature Requests**

- Explain the use case and benefits
- Consider performance implications
- Suggest implementation approaches

### 🔧 **Pull Requests**

1. Fork the repository: `git clone https://github.com/nhktmdzhg/nvim.git`
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Test your changes thoroughly
4. Update documentation if needed
5. Submit a pull request with detailed description

### 📋 **Contribution Guidelines**

- Maintain the existing code style and structure
- Ensure all plugins are properly lazy-loaded for performance
- Test configurations on multiple file types
- Update the README if adding new features

## 🙏 Acknowledgments

### � **Special Thanks**

- **Neovim Team** - For creating an amazing extensible editor
- **Plugin Authors** - For their incredible work on the ecosystem
- **Catppuccin Team** - For the beautiful color scheme
- **Community Contributors** - For feedback and improvements

### 💝 **Inspiration**

This configuration draws inspiration from the broader Neovim community and incorporates best practices from various configurations while maintaining a unique ミツキナノカ aesthetic.

---

<div align='center'>

**⭐ Star this repository if you find it helpful!**

**🍴 Fork it to make it your own!**

_Made with ❤️ by ミツキナノカ for the Neovim community_

_"Welcome to the world of ミツキナノカ"_ ✨

</div>
