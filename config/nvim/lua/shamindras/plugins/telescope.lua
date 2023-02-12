-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, 'telescope')
if not telescope_setup then
  return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, 'telescope.actions')
if not actions_setup then
  return
end

-- configure telescope
telescope.setup({
  -- configure custom mappings
  defaults = {
    layout_config = { prompt_position = 'top' },
    sorting_strategy = 'ascending',
    winblend = 0,
    mappings = {
      i = {
        ['<C-n>'] = actions.move_selection_next, -- move to next result
        ['<C-p>'] = actions.move_selection_previous, -- move to prev result
        ['<C-j>'] = actions.cycle_history_next, -- move to next history result
        ['<C-k>'] = actions.cycle_history_prev, -- move to prev history result
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
      n = {
        ['q'] = function(...)
          return require('telescope.actions').close(...)
        end,
      },
    },
    -- Default configuration for telescope goes here:
    -- config_key = value,
    vimgrep_arguments = {
      'rg',
      -- '--color=always',
      '--no-heading',
      '--hidden',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--trim', -- add this value
    },
    pickers = {
      find_files = {
        find_command = { 'rg', '--files', '--hidden' },
        -- hidden = true,
        -- FIX: does not seem to work correctly with hidden files
        -- find_command = {
        --   'rg',
        --   '--color=always',
        --   '--find_files',
        --   '--no-heading',
        --   '--hidden',
        --   '--smart-case',
        -- },

        -- find_command = {
        --   'fd',
        --   '.',
        --   '--type',
        --   'file',
        --   '--hidden',
        --   '--strip-cwd-prefix',
        -- },
      },
    },
    -- file_ignore_patterns = { '^./.git/', '^node_modules/', '^submods/' },
    file_ignore_patterns = { 'git', 'node_modules', 'submods' },
  },
})

telescope.load_extension('fzf')
