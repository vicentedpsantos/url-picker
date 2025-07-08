local window = require("url-picker.window")
local actions = require("url-picker.actions")

local M = {}

function M.setup_keybindings(window_info)
  local buf = window_info.buf
  local win = window_info.win
  local urls = window_info.urls
  
  local function get_selected_url()
    return window.get_selected_url(window_info)
  end
  
  local function close_window()
    window.close_window(window_info)
  end
  
  vim.api.nvim_buf_set_keymap(buf, "n", "q", "", {
    callback = close_window,
    noremap = true,
    silent = true
  })
  
  vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", "", {
    callback = close_window,
    noremap = true,
    silent = true
  })
  
  vim.api.nvim_buf_set_keymap(buf, "n", "c", "", {
    callback = function()
      local url_info = get_selected_url()
      if url_info then
        actions.copy_url(url_info.url)
      end
    end,
    noremap = true,
    silent = true
  })
  
  vim.api.nvim_buf_set_keymap(buf, "n", "o", "", {
    callback = function()
      local url_info = get_selected_url()
      if url_info then
        actions.open_url(url_info.url)
        close_window()
      end
    end,
    noremap = true,
    silent = true
  })
  
  vim.api.nvim_buf_set_keymap(buf, "n", "g", "", {
    callback = function()
      local url_info = get_selected_url()
      if url_info then
        close_window()
        actions.goto_url_in_buffer(url_info.url)
      end
    end,
    noremap = true,
    silent = true
  })
  
  vim.api.nvim_buf_set_keymap(buf, "n", "<CR>", "", {
    callback = function()
      local url_info = get_selected_url()
      if url_info then
        close_window()
        actions.jump_to_line(url_info)
      end
    end,
    noremap = true,
    silent = true
  })
  
  vim.api.nvim_buf_set_keymap(buf, "n", "d", "", {
    callback = function()
      local url_info = get_selected_url()
      if url_info then
        actions.copy_domain(url_info.url)
      end
    end,
    noremap = true,
    silent = true
  })
  
  vim.api.nvim_create_autocmd("WinLeave", {
    buffer = buf,
    callback = close_window,
    once = true
  })
end

return M
