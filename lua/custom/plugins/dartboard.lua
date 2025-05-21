return {
  {
    -- dir = '/home/mark/src/lua/dartboard.nvim', -- Local path to the plugin
    'markgandolfo/dartboard.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require('dartboard').setup {
        -- Your configuration options here
      }
    end,
  },
}
