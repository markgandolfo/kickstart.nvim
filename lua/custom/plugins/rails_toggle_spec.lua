return {
  'markgandolfo/rails_toggle_spec.nvim',
  config = function()
    require('rails_toggle_spec').setup {
      create_mappings = false, -- Disable default keymappings
      vim.api.nvim_set_keymap('n', '<Leader>rs', ':RailsToggleSpec<CR>', { noremap = true, silent = true }),
    }
  end,
}
