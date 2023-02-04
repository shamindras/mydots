local colorscheme = 'catppuccin'
local status, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status then
  vim.notify('Colorscheme ' .. colorscheme .. ' not found!')
  return
end

-- change CursorLine background color
-- this needs to be changed here, and not in options
-- vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#010101' })
