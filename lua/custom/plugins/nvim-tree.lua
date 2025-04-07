return {

  { -- add indentation guides even on blank lines
    'nvim-tree/nvim-tree.lua',
    opts = {
      view = {
        side = 'right',
        width = 40,
      },
    },
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    keys = {
      {
        '<Leader>fb',
        ':NvimTreeToggle<CR>',
        desc = 'Toggle nvim tree',
      },
    },
  },
}
