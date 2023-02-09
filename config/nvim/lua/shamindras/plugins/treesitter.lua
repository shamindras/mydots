-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  -- TODO: currently disabled python indentation since it can cause issues
  -- when editing python scripts. Experiment and see if we need to revert this
  -- setting.
  -- source: https://www.reddit.com/r/neovim/comments/l3mpiv/comment/gkn44vu/?utm_source=share&utm_medium=web2x&context=3
  -- TODO: have also disabled it for lua, since we will handle this using
  -- `stylua.toml`, again will need to monitor it carefully.
  indent = { enable = true, disable = { 'python', 'lua' } },
  -- indent = { enable = true },
  -- FIXME: the `textobjects` code below, `vam` does not visually select the
  -- entire function
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['am'] = '@function.outer',
        ['im'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['af'] = '@call.outer',
        ['if'] = '@call.inner',
        ['ap'] = '@parameter.outer',
        ['ip'] = '@parameter.inner',
        ['al'] = '@loop.outer',
        ['il'] = '@loop.inner',
        ['ai'] = '@conditional.outer',
        ['ii'] = '@conditional.inner',
        ['a/'] = '@comment.outer',
      },
    },

    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
        [']p'] = '@parameter.outer',
        [']f'] = '@call.outer',
        [']b'] = '@block.outer',
      },
      goto_next_end = {
        [']t'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
        ['[p'] = '@parameter.outer',
        ['[f'] = '@call.outer',
        ['[b'] = '@block.outer',
      },
      goto_previous_end = {
        ['[t'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    'bash',
    'css',
    'dockerfile',
    'gitignore',
    'graphql',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'python',
    'svelte',
    'tsx',
    'typescript',
    'vim',
    'yaml',
  },
  -- auto install above language parsers
  auto_install = true,
})
