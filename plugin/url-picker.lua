if vim.fn.has('nvim-0.7.0') == 0 then
  vim.api.nvim_err_writeln('url-picker requires at least Neovim v0.7.0')
  return
end

require('url-picker')
