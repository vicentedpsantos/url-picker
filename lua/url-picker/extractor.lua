local M = {}

function M.extract_urls()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local urls = {}
  local url_pattern = "https?://[%w-_.~:/?#@!$&'()*+,;=%%]+"
  
  for line_num, line in ipairs(lines) do
    for url in string.gmatch(line, url_pattern) do
      local cleaned_url = url:gsub("[%)%]%.,;:!%?]+$", "")
      table.insert(urls, {
        url = cleaned_url,
        line = line_num,
        display = string.format("%d: %s", line_num, cleaned_url)
      })
    end
  end
  
  return urls
end

return M
