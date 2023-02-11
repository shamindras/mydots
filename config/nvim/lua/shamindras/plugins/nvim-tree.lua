-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, 'nvim-tree')
if not setup then
  return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- configure nvim-tree
nvimtree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  filesystem_watchers = {
    enable = true,
  },
  -- change folder arrow icons
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = '', -- arrow when folder is closed
          arrow_open = '', -- arrow when folder is open
        },
      },
    },
    indent_markers = { enable = true },
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  view = {
    adaptive_size = false,
    width = 30,
    side = 'right',
  },
  -- 	git = {
  -- 		ignore = false,
  -- 	},
})
