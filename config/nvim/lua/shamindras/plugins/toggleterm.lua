local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
  return
end

local terminal_status_ok, terminal = pcall(require, 'toggleterm.terminal')
if not terminal_status_ok then
  return
end

toggleterm.setup({
  size = 36,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'float',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
  },
})

local Terminal = terminal.Terminal
local regularterm = Terminal:new({ hidden = true }) -- regular terminal session
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })
local vifm = Terminal:new({ cmd = 'vifm', hidden = true })

function _REGULARTERM_TOGGLE()
  regularterm:toggle()
end

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

function _VIFM_TOGGLE()
  vifm:toggle()
end

-- regular terminal toggle, i.e., zsh
vim.keymap.set(
  'n',
  '<leader>zt',
  '<cmd>lua _REGULARTERM_TOGGLE()<CR>',
  { silent = true }
)

-- git
vim.keymap.set(
  'n',
  '<leader>gg',
  '<cmd>lua _LAZYGIT_TOGGLE()<CR>',
  { silent = true }
)

-- vifm
vim.keymap.set(
  'n',
  '<leader>vv',
  '<cmd>lua _VIFM_TOGGLE()<CR>',
  { silent = true }
)
