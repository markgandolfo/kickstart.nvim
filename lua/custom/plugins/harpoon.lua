return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'folke/which-key.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'

    -- Setup with Telescope configuration
    harpoon:setup {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    }

    -- Telescope integration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
          attach_mappings = function(_, map)
            map('n', 'x', function(prompt_bufnr)
              local selection = require('telescope.actions.state').get_selected_entry()

              local file_idx = nil
              for i, file in ipairs(file_paths) do
                if file == selection.value then
                  file_idx = i
                  break
                end
              end

              if file_idx then
                harpoon:list():remove_at(file_idx)
              end
              require('telescope.actions').close(prompt_bufnr)
            end)

            map('i', '<CR>', function(prompt_bufnr)
              local selection = require('telescope.actions.state').get_selected_entry()
              require('telescope.actions').close(prompt_bufnr)

              local file_idx = nil
              for i, file in ipairs(file_paths) do
                if file == selection.value then
                  file_idx = i
                  break
                end
              end

              if file_idx then
                harpoon:list():select(file_idx)
              end
            end)
            return true
          end,
        })
        :find()
    end

    local wk = require 'which-key'

    wk.add {
      {
        '<leader>ha',
        function()
          harpoon:list():add()
        end,
        desc = 'Harpoon',
      },
      {
        '<leader>hl',
        function()
          toggle_telescope(harpoon:list())
        end,
        desc = 'List harpoon files',
      },
      {
        '<leader>hc',
        function()
          harpoon:list():clear()
        end,
        desc = 'Remove harpoon files',
      },
      {
        '<leader>hq',
        function()
          harpoon:list():clear_all()
        end,
        desc = 'Clear all harpoon marks',
      },

      {
        '<leader>1',
        function()
          harpoon:list():select(1)
        end,
        desc = 'Go to file 1',
      },
      {
        '<leader>2',
        function()
          harpoon:list():select(2)
        end,
        desc = 'Go to file 2',
      },
      {
        '<leader>3',
        function()
          harpoon:list():select(3)
        end,
        desc = 'Go to file 3',
      },
      {
        '<leader>4',
        function()
          harpoon:list():select(4)
        end,
        desc = 'Go to file 4',
      },
    }

    --
    -- -- Keymaps
    -- vim.keymap.set('n', '<leader>ha', function()
    --   harpoon:list():add()
    -- end)
    -- vim.keymap.set('n', '<Leader>hl', function()
    --   toggle_telescope(harpoon:list())
    -- end)
    -- vim.keymap.set('n', '<Leader>hr', function()
    --   toggle_telescope(harpoon:remove())
    -- end)
    -- vim.keymap.set('n', '<Leader>hq', function()
    --   harpoon:list():remove()
    -- end)
    -- vim.keymap.set('n', '<Leader>1', function()
    --   harpoon:list():select(1)
    -- end)
    -- vim.keymap.set('n', '<Leader>2', function()
    --   harpoon:list():select(2)
    -- end)
    -- vim.keymap.set('n', '<Leader>3', function()
    --   harpoon:list():select(3)
    -- end)
    -- vim.keymap.set('n', '<Leader>4', function()
    --   harpoon:list():select(4)
    -- end)
  end,
}
