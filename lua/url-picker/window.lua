local M = {}

function M.create_window(urls)
  if #urls == 0 then
    vim.notify("No URLs found in buffer", vim.log.levels.INFO)
    return nil
  end
  
  local width = math.min(180, vim.o.columns - 10)
  local height = math.min(#urls + 2, 20)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)
  
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = " url-picker (" .. #urls .. ") ",
    title_pos = "center"
  })
  
  M.populate_buffer(buf, urls)
  
  return {
    buf = buf,
    win = win,
    urls = urls
  }
end

function M.populate_buffer(buf, urls)
  local lines = {}
  for i, url_info in ipairs(urls) do
    table.insert(lines, string.format("%d. %s", i, url_info.display))
  end
  
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, "modifiable", false)
  vim.api.nvim_buf_set_option(buf, "filetype", "url-list")
end

function M.close_window(window_info)
  if vim.api.nvim_win_is_valid(window_info.win) then
    vim.api.nvim_win_close(window_info.win, true)
  end
end

function M.get_selected_url(window_info)
  local cursor = vim.api.nvim_win_get_cursor(window_info.win)
  local line_num = cursor[1]
  if line_num <= #window_info.urls then
    return window_info.urls[line_num]
  end
  return nil
end

return M
