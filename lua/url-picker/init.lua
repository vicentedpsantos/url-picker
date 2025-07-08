local extractor = require("url-picker.extractor")
local window = require("url-picker.window")
local keybindings = require("url-picker.keybindings")

local M = {}

function M.show_urls()
  local urls = extractor.extract_urls()
  local window_info = window.create_window(urls)
  
  if window_info then
    keybindings.setup_keybindings(window_info)
  end
end

function M.setup(opts)
  opts = opts or {}
  
  vim.api.nvim_create_user_command("ShowUrls", function()
    M.show_urls()
  end, {})
  
  if opts.keymap then
    vim.keymap.set("n", opts.keymap, M.show_urls, {desc = "Show URLs in buffer"})
  end
end

return M
