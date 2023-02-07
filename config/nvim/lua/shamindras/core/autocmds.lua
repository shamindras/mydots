-- TODO: add more comments describing each autocmd
-- TODO: ensure that each autocmd is in the proper `nvim_create_augroup`

-- Config reload commands
-- source: https://github.com/joshmedeski/dotfiles/blob/bb548e546f/mackup/.config/nvim/lua/joshmedeski/autocmd.lua

-- reload tmux after updating config
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { '*tmux.conf' },
  command = "execute 'silent !tmux source <afile> --silent'",
})

-- reload yabai using brew after updating config
local restart_brew_conf_group =
  vim.api.nvim_create_augroup('restart_brew_conf', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { 'yabairc', '.yabairc' },
  command = '!brew services restart yabai',
  group = restart_brew_conf_group,
})

-- reload skhd using brew after updating config
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { 'skhdrc', '.skhdrc' },
  command = '!brew services restart skhd',
  group = restart_brew_conf_group,
})

-- lazyvim autocmds
-- source: https://www.lazyvim.org/configuration/general#auto-commands

-- Highlight on yank
local highlight_on_yank_group =
  vim.api.nvim_create_augroup('highlight_on_yank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 750 })
  end,
  group = highlight_on_yank_group,
  pattern = '*',
})

-- resize splits if window got resized
local resize_window_group =
  vim.api.nvim_create_augroup('resize_window', { clear = true })
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  callback = function()
    vim.cmd('tabdo wincmd =')
  end,
  group = resize_window_group,
})

-- Goto last location when opening a buffer.
local go_last_location_buffer_group =
  vim.api.nvim_create_augroup('go_last_location_buffer', { clear = true })
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  group = go_last_location_buffer_group,
})

-- close some filetypes with <q>
local close_buffer_q_group =
  vim.api.nvim_create_augroup('close_buffer_q', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'help',
    'lspinfo',
    'man',
    'notify',
    'PlenaryTestPopup',
    'qf',
    'spectre_panel',
    'startuptime',
    'tsplayground',
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
  group = close_buffer_q_group,
})

-- format options
-- source: https://github.com/tjdevries/config_manager/blob/66d5262e1d142bfde5ebc19ba120ae86cb16d1d9/xdg_config/nvim/plugin/options.lua#L82-L91
local formatoptions_mod_group =
  vim.api.nvim_create_augroup('formatoptions_mod', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    -- let comments respect textwidth
    vim.cmd([[ setlocal formatoptions+=c ]])

    -- auto-remove comments if possible
    vim.cmd([[ setlocal formatoptions+=j ]])

    -- Indent past the formatlistpat, not underneath it.
    vim.cmd([[ setlocal formatoptions+=n ]])

    -- allow formatting comments with `gq`
    vim.cmd([[ setlocal formatoptions+=q ]])

    -- do not continue comments with `O` or `o`
    vim.cmd([[ setlocal formatoptions-=o ]])

    -- do continue comments when pressing enter
    vim.cmd([[ setlocal formatoptions+=r ]])

    -- TODO: add more details on this option
    vim.cmd([[ setlocal formatoptions-=2 ]])

    -- no need to autoformat, use linters
    vim.cmd([[ setlocal formatoptions-=a ]])

    -- auto-wrap text using textwidth
    vim.cmd([[ setlocal formatoptions+=t ]])
  end,
  group = formatoptions_mod_group,
  pattern = { '*' },
})
