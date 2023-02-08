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
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next, -- move to next result
        ['<C-k>'] = actions.move_selection_previous, -- move to prev result
        -- ['<C-j>'] = actions.cycle_history_next, -- move to next history result
        -- ['<C-k>'] = actions.cycle_history_prev, -- move to prev history result
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
      n = {
        ['q'] = function(...)
          return require('telescope.actions').close(...)
        end,
      },
    },
  },
})

telescope.load_extension('fzf')
