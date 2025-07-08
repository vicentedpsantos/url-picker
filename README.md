# URL Picker

A simple Neovim plugin that extracts all URLs from the current buffer and displays them in a floating window for easy navigation and interaction.

## Features

- Extract all HTTP/HTTPS URLs from the current buffer
- Display URLs in a floating window with line numbers
- Navigate through URLs with vim-like keybindings
- Copy URLs to clipboard
- Open URLs in default browser
- Jump to URL location in buffer
- Search for URLs in buffer
- Copy domain names only
- Cross-platform support (macOS, Linux)

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "vicentedpsantos/url-picker.nvim",
  config = function()
    require("url-picker").setup({
      keymap = "<leader>u"  -- Optional: set global keymap
    })
  end
}
```

## Usage

Use the command `:ShowUrls` or set up a keymap during configuration.

## Keybindings

When the URL picker window is open:

| Key | Action |
|-----|--------|
| `j` / `k` | Navigate up/down through URLs |
| `c` | Copy selected URL to clipboard |
| `o` | Open selected URL in default browser |
| `<CR>` (Enter) | Jump to the line where URL is located |
| `g` | Search for selected URL in buffer |
| `d` | Copy domain name only |
| `q` / `<Esc>` | Close the window |

## Configuration

```lua
require("url-picker").setup({
  keymap = "<leader>u"  -- Optional: global keymap to open URL picker
})
```

If no keymap is provided, you can use the `:ShowUrls` command directly.

## File Structure

```
lua/url-picker/
├── init.lua          # Main plugin entry point
├── extractor.lua     # URL extraction logic
├── actions.lua       # URL actions (copy, open, etc.)
├── window.lua        # Window management
└── keybindings.lua   # Keyboard shortcuts
```

## Requirements

- Neovim 0.5+
- System clipboard support (`+` register)
- Default browser configured for URL opening

## Contributing

This plugin is for my personal use and I'm not actively seeking contributions. Feel free to fork and modify for your own needs.

## License

MIT
