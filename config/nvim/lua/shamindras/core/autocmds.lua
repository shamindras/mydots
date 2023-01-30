-- TODO: add more comments describing each autocmd

-- Josh Medeski's autocmds
-- source: https://github.com/joshmedeski/dotfiles/blob/bb548e546f/mackup/.config/nvim/lua/joshmedeski/autocmd.lua
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { '*tmux.conf' },
  command = "execute 'silent !tmux source <afile> --silent'",
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { '.yabairc' },
  command = '!brew services restart yabai',
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { '.skhdrc' },
  command = '!brew services restart skhd',
})

-- lazyvim autocmds
-- source: https://www.lazyvim.org/configuration/general#auto-commands
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ 'VimResized' }, {
  callback = function()
    vim.cmd('tabdo wincmd =')
  end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'qf',
    'help',
    'man',
    'notify',
    'lspinfo',
    'spectre_panel',
    'startuptime',
    'tsplayground',
    'PlenaryTestPopup',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set(
      'n',
      'q',
      '<cmd>close<cr>',
      { buffer = event.buf, silent = true }
    )
  end,
})
