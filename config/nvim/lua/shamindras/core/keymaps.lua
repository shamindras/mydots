-- set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap -- for conciseness
local opt_silent = { silent = true } -- suppress output in keymaps

---------------------
-- General Keymaps
---------------------

-- use jj to exit insert mode
keymap.set('i', 'jj', '<ESC>l')

-- clear search highlights
keymap.set('n', '<leader>nh', '<cmd>nohl<CR>')

-- delete/change single character without copying into register
keymap.set('n', 'x', '"_x')
keymap.set('n', 'X', '"_X')
-- TODO: check whether the following are correct
keymap.set('n', 'c', '"_c')
keymap.set('n', 'C', '"_C')

-- increment/decrement numbers
keymap.set('n', '<leader>+', '<C-a>') -- increment
keymap.set('n', '<leader>-', '<C-x>') -- decrement

-- window management
keymap.set('n', '<leader>sv', '<C-w>v', opt_silent) -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s', opt_silent) -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=', opt_silent) -- make split windows equal width & height
keymap.set('n', '<leader>sx', '<cmd>close<CR>', opt_silent) -- close current split window

keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', opt_silent) -- open new tab
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', opt_silent) -- close current tab
keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', opt_silent) --  go to next tab
keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', opt_silent) --  go to previous tab

-- Map H and L to ^ and $, respectively
-- source: https://github.com/famiu/dot-nvim/blob/d7922d6ce9d9483cd68c67abb883e8ab91a17e4f/lua/keybinds.lua#L4-L6
keymap.set('n', 'H', '^', opt_silent)
keymap.set('n', 'L', '$', opt_silent)

-- Don't leave visual mode after indenting
-- source: https://github.com/famiu/dot-nvim/blob/d7922d6ce9d9483cd68c67abb883e8ab91a17e4f/lua/keybinds.lua#L8-L10
keymap.set('v', '>', '>gv^', opt_silent)
keymap.set('v', '<', '<gv^', opt_silent)

---------------------
-- Primagean Keymaps
-- source: https://github.com/ThePrimeagen/init.lua/blob/bc8324fa1c31bd1bc81fb8a5dde684dffd324f84/lua/theprimeagen/remap.lua
---------------------

keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

keymap.set('n', 'Y', 'yg$') -- yank up to the end of visual line
keymap.set('n', 'J', 'mzJ`z')
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

-- greatest remap ever
keymap.set('x', '<leader>p', '"_dP')

-- next greatest remap ever : asbjornHaland
keymap.set('n', '<leader>y', '"+y')
keymap.set('v', '<leader>y', '"+y')
keymap.set('n', '<leader>Y', '"+Y')

keymap.set('n', '<leader>d', '"_d')
keymap.set('v', '<leader>d', '"_d')

keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- search and replace current cursor keyword
keymap.set(
  'n',
  '<leader>sr',
  ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>'
)

-- change current file to executable
keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', opt_silent)

----------------------
-- Wrapping Keybinds
----------------------
-- Mappings for navigating wrapped lines
-- source: https://www.lazyvim.org/configuration/general#keymaps
vim.keymap.set(
  'n',
  'j',
  "v:count == 0 ? 'gj' : 'j'",
  { expr = true, silent = true }
)
vim.keymap.set(
  'n',
  'k',
  "v:count == 0 ? 'gk' : 'k'",
  { expr = true, silent = true }
)

-- quickly executing macros with the q register
vim.keymap.set('n', 'Q', '@q')
vim.keymap.set('v', 'Q', '<cmd>norm @q<cr>')

-- vim-maximizer
keymap.set('n', '<leader>sm', '<cmd>MaximizerToggle<CR>') -- toggle split window maximization

-- nvim-tree
keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', opt_silent) -- toggle file explorer

-- delete/yank entire buffer
keymap.set('n', '<leader>yb', ':%y+<CR>')
keymap.set('n', '<leader>db', ':%delete<CR>')

-- telescope
-- use ripgrep as the file finder, and exclude submods directory, else there is
-- too much search noise within imported submodules
keymap.set(
  'n',
  '<leader>ff',
  -- "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden'}})<cr>",
  -- FIX: figure out why `find_files` in telescope config does not make the
  -- line below work directly
  "<cmd>lua require'telescope.builtin'.find_files()<cr>",
  -- "<cmd>lua require'telescope.builtin'.find_files({hidden = true})<cr>",
  { noremap = true }
)
-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set(
  'n',
  '<leader>fs',
  -- "<cmd>lua require'telescope.builtin'.live_grep({ find_command = {'rg', '--hidden'}})<cr>",
  "<cmd>lua require'telescope.builtin'.live_grep()<cr>",
  { noremap = true }
)
-- keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>') -- find string in current working directory as you type
keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>') -- find string under cursor in current working directory
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>') -- list open buffers in current neovim instance
keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>') -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits<cr>') -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set('n', '<leader>gfc', '<cmd>Telescope git_bcommits<cr>') -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<cr>') -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<cr>') -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set('n', '<leader>rs', '<cmd>LspRestart<CR>') -- mapping to restart lsp if necessary
