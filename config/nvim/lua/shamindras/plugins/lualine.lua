-- import lualine plugin safely
local status, lualine = pcall(require, 'lualine')
if not status then
  return
end

-- import catppuccin theme safely
local status_ok, theme = pcall(require, 'lualine.themes.catppuccin')
if not status_ok then
  return
end
theme.normal.c.bg = nil

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn', 'info', 'hint' },
  symbols = { error = ' ', warn = ' ', hint = ' ', info = ' ' },
  colored = true,
  update_in_insert = false,
  always_visible = false,
}

local diff = {
  'diff',
  colored = true,
  symbols = { added = ' ', modified = ' ', removed = ' ' },
  cond = hide_in_width,
}

-- configure lualine with modified theme
lualine.setup({
  options = {
    theme = theme,
    icons_enabled = true,
    always_divide_middle = false,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'Outline' },
  },

  sections = {
    lualine_a = { 'mode' },
    lualine_b = { diff, diagnostics, 'branch' },
    lualine_c = {
      {
        'filename',
        -- 0 = just filename, 1 = relative path, 2 = absolute path
        path = 1,
      },
    },
    lualine_x = {
      { 'fileformat', colored = true, icon_only = false },
      { 'filetype', colored = true, icon_only = false },
    },
    -- lualine_x = { 'fileformat', 'filetype' },
    lualine_y = {},
    lualine_z = { 'location' },
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filetype', 'location' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
