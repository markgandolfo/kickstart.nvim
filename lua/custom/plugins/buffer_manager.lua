return {
  'j-morano/buffer_manager.nvim',
  opts = {
    short_file_names = true,
  },
  keys = {
    {
      '<Leader>bb',
      function()
        require('buffer_manager.ui').toggle_quick_menu()
      end,
      desc = 'Toggle buffer manager',
    },
  },
}
