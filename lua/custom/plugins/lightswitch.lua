return {
  dir = '/home/mark/src/lua/lightswitch.nvim',
  -- 'markgandolfo/lightswitch.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  config = function()
    require('lightswitch').setup {
      toggles = {
        {
          name = 'Copilot',
          enable_cmd = ':Copilot enable<CR>',
          disable_cmd = ':Copilot disable<CR>',
          state = true,
        },
        {
          name = 'Highlight Colors',
          enable_cmd = "require('nvim-highlight-colors').turnOn()",
          disable_cmd = "require('nvim-highlight-colors').turnOff()",
          state = true,
        },
      },
    }
  end,
}
