local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
-- how many columns of whitespace is a tab keypress or a backspace keypress worth
vim.opt.softtabstop = 4
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.smartindent = true

-- Use global statusline
opt.laststatus = 3
vim.api.nvim_set_hl(0, 'WinSeparator', { bg = 'None' })

-- expand the wildmenu
opt.wildmode = 'longest:full,full'

-- line wrapping
opt.wrap = false -- disable line wrapping

-- disable default vim start screen display
-- opt.shortmess = opt.shortmess .. 'I'

-- Text behaviour
-- source: https://github.com/tjdevries/config_manager/blob/66d5262e1d142bfde5ebc19ba120ae86cb16d1d9/xdg_config/nvim/plugin/options.lua#L82-L91
-- TODO: these formatoptions are overridden at runtime, may need to insert this
-- in the `ftplugin` directory. See https://www.reddit.com/r/neovim/comments/sqld76/comment/hwmoc0z/?utm_source=share&utm_medium=web2x&context=3
-- for details.
opt.formatoptions = opt.formatoptions
  - 'a' -- Auto formatting is BAD.
  + 't' -- auto-wrap text using textwidth
  + 'c' -- In general, I like it when comments respect textwidth
  + 'q' -- Allow formatting comments w/ gq
  - 'o' -- O and o, don't continue comments
  + 'r' -- But do continue when pressing enter.
  + 'n' -- Indent past the formatlistpat, not underneath it.
  + 'j' -- Auto-remove comments if possible.
  - '2' -- I'm not in gradeschool anymore

-- don't use 2 spaces when joining sentences
opt.joinspaces = false

-- disable default vim startup display screen
opt.shortmess:append('I')

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = 'dark' -- colorschemes that can be light or dark will be made dark
opt.signcolumn = 'yes' -- show sign column so that text doesn't shift
vim.opt.colorcolumn = '80'

-- backspace
opt.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append('unnamedplus') -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append('-') -- consider string-string as whole word

---------------------
-- Primagean Keymaps
-- source: https://github.com/ThePrimeagen/init.lua/blob/bc8324fa1c31bd1bc81fb8a5dde684dffd324f84/lua/theprimeagen/set.lua
---------------------

vim.opt.guicursor = ''

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 50
