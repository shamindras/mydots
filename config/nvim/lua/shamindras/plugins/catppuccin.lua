require('catppuccin').setup({
  flavour = 'mocha', -- latte, frappe, macchiato, or mocha
  -- transparent_background = true,
  color_overrides = {
    all = {
      surface0 = '#444444',
      surface1 = '#666666',
      surface2 = '#a3a7bc',
      surface3 = '#a3a7bc',
    },
    -- mocha = {
    --   base = '#000000',
    --   mantle = '#000000',
    --   crust = '#000000',
    -- },
  },
  integrations = {
    aerial = false,
    barbar = false,
    beacon = false,
    cmp = true,
    coc_nvim = false,
    dashboard = true,
    fern = false,
    fidget = false,
    gitgutter = false,
    gitsigns = true,
    harpoon = false,
    hop = false,
    illuminate = false,
    leap = false,
    lightspeed = false,
    lsp_saga = false,
    lsp_trouble = false,
    markdown = true,
    mason = true,
    mini = false,
    neogit = false,
    neotest = false,
    neotree = false,
    noice = false,
    notify = false,
    nvimtree = true,
    overseer = false,
    pounce = false,
    semantic_tokens = false,
    symbols_outline = false,
    telekasten = false,
    telescope = true,
    treesitter = true,
    treesitter_context = false,
    ts_rainbow = false,
    vim_sneak = false,
    vimwiki = false,
    which_key = false,

    -- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
    dap = {
      enabled = false,
      enable_ui = false,
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
      },
    },
    navic = {
      enabled = false,
      custom_bg = 'NONE',
    },
  },
})
