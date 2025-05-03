local M = {}

function M.generate_ruby_tags()
  local cmd = 'ctags -R --languages=ruby --fields=+l --extras=+q --exclude=.git --exclude=node_modules'
  local result = vim.fn.system(cmd)

  if vim.v.shell_error ~= 0 then
    vim.notify('Error generating CTags: ' .. result, vim.log.levels.ERROR)
  else
    vim.notify('CTags generated successfully', vim.log.levels.INFO)
  end
end

-- Async version of the same function
function M.generate_ruby_tags_async()
  local cmd = {
    'ctags',
    '-R',
    '--languages=ruby',
    '--fields=+l',
    '--extras=+q',
    '--exclude=.git',
    '--exclude=node_modules',
  }

  -- Show initial message
  vim.notify('Generating CTags...', vim.log.levels.INFO)

  -- Run the command asynchronously
  local job_id = vim.fn.jobstart(cmd, {
    on_exit = function(_, exit_code)
      if exit_code == 0 then
        vim.notify('CTags generated successfully', vim.log.levels.INFO)
      else
        vim.notify('Error generating CTags (exit code: ' .. exit_code .. ')', vim.log.levels.ERROR)
      end
    end,
    on_stderr = function(_, data)
      if data and #data > 0 then
        vim.notify('CTags error: ' .. table.concat(data, '\n'), vim.log.levels.ERROR)
      end
    end,
  })

  if job_id <= 0 then
    vim.notify('Failed to start CTags job', vim.log.levels.ERROR)
  end
end

-- Setup function to create keymaps
function M.setup(opts)
  opts = opts or {}
  local keys = opts.keys or {
    all_tags = '<Leader>ct',
  }

  -- Create mappings
  vim.keymap.set('n', keys.all_tags, M.generate_all_tags, { desc = 'Generate All Tags' })
end

-- Function for all languages
function M.generate_all_tags()
  local cmd = 'ctags -R --fields=+l --extras=+q --exclude=.git --exclude=node_modules'

  local result = vim.fn.system(cmd)

  if vim.v.shell_error ~= 0 then
    vim.notify('Error generating CTags: ' .. result, vim.log.levels.ERROR)
  else
    vim.notify('CTags generated successfully', vim.log.levels.INFO)
  end
end

-- Return the module
return {
  M.setup(),
}
