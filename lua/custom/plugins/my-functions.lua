return {
  -- Highlight the word under the cursor
  vim.keymap.set('n', '<leader>*', function()
    vim.cmd.match(string.format('Visual /%s/', vim.fn.expand '<cword>'))
  end, { desc = 'Highlight word under cursor' }),

  -- Copy the current file path to the clipboard
  vim.keymap.set('n', '<Leader>cp', function()
    local path = vim.fn.expand '%'
    vim.fn.setreg('+', path)
    print('Relative path copied: ' .. path)
  end, { silent = true, desc = 'Copy relative file name to clipboard' }),

  -- Copy the full file path to the clipboard
  vim.keymap.set('n', '<Leader>cfp', function()
    local path = vim.fn.expand '%:p'
    vim.fn.setreg('+', path)
    print('Full path copied: ' .. path)
  end, { silent = true, desc = 'Copy full path + file name to clipboard' }),

  -- Remove trailing whitespace and restore cursor position
  vim.keymap.set('n', '<leader>tw', 'mm:%s/\\s\\+$//e<CR>`m', { desc = 'Remove trailing whitespace and restore cursor position' }),

  vim.keymap.set('n', '<Leader>j', ':bnext<CR>', { desc = 'Next Buffer' }),
  vim.keymap.set('n', '<Leader>k', ':bnext<CR>', { desc = 'Prev Buffer' }),
  vim.keymap.set('n', '<Leader>bda', ':bufdo bd<CR>', { desc = 'Close all Buffers' }),
  vim.keymap.set('n', '<Leader>bde', ':%bd|e#<CR>', { desc = 'Close all Buffers execpt this one' }),
  vim.keymap.set('n', '<Leader>bdd', ':bd<CR>', { desc = 'Close current buffer' }),
  vim.keymap.set('n', '<Leader>bd!', ':bd!<CR>', { desc = 'Close current buffer without saving' }),
}
