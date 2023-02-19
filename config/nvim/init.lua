-- packer cache for faster loading
require('shamindras.plugins.impatient') -- impatient must be loaded first
require('shamindras.plugins-setup')

-- setup basic autocommands and keybindings
require('shamindras.core.keymaps')
require('shamindras.core.autocmds')

-- setup basic options, keymaps, and autocmds
require('shamindras.core.options')

-- setup better escape
require('shamindras.plugins.better-escape')

-- color scheme and themes
require('shamindras.plugins.catppuccin') -- catppuccin color theme
require('shamindras.core.colorscheme') -- load this after loading color theme

-- plugin management
-- commenting, tree explorer, status line
require('shamindras.plugins.comment')
require('shamindras.plugins.nvim-tree')
require('shamindras.plugins.lualine')

-- fuzzy finding within project
require('shamindras.plugins.telescope')

-- surround text
require('shamindras.plugins.nvim-surround')

-- indent blank lines indicator
require('shamindras.plugins.indent-blankline')

-- toggle terminal
require('shamindras.plugins.toggleterm')

-- lsp and auto-completion
require('shamindras.plugins.nvim-cmp')
require('shamindras.plugins.lsp.mason')
require('shamindras.plugins.lsp.lspsaga')
require('shamindras.plugins.lsp.lspconfig')
require('shamindras.plugins.lsp.null-ls')

-- text editing, e.g., autopairs, tabbing out of pairs
require('shamindras.plugins.autopairs')
require('shamindras.plugins.tabout')
require('shamindras.plugins.todo-comments')

-- syntax highlighting and code parsing
require('shamindras.plugins.treesitter')

-- ui and git changes
require('shamindras.plugins.nvim-colorizer')
require('shamindras.plugins.gitsigns')
