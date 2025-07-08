local M = {}

function M.copy_url(url)
  vim.fn.setreg("+", url)
  vim.notify("URL copied to clipboard: " .. url, vim.log.levels.INFO)
end

function M.open_url(url)
  local cmd = vim.fn.has("mac") == 1 and "open" or "xdg-open"
  vim.fn.jobstart({cmd, url}, {detach = true})
end

function M.goto_url_in_buffer(url)
  vim.cmd("/" .. vim.fn.escape(url, "/."))
end

function M.jump_to_line(url_info)
  vim.api.nvim_win_set_cursor(0, {url_info.line, 0})
end

function M.copy_domain(url)
  local domain = url:match("https?://([^/]+)")
  if domain then
    vim.fn.setreg("+", domain)
    vim.notify("Domain copied to clipboard: " .. domain, vim.log.levels.INFO)
  end
end

return M
