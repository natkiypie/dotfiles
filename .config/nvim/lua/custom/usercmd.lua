local usercmd = vim.api.nvim_create_user_command
local userfn = require 'custom.userfn'

--File Manipulation
usercmd('Cppath', function()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard')
end, {})

--Git
usercmd('GitMergeUpdate', function()
  if not userfn.is_git_repo() then
    return
  end
  if userfn.git_working_tree_clean() then
    return vim.notify('Changes not staged for commit', vim.log.levels.INFO, {})
  end
  local branch = userfn.get_git_branch()
  if branch == 'update' then
    vim.cmd [[
      Git checkout main
      Git merge update
      Git push
      Git checkout update
    ]]
  else
    return vim.notify('Not on update', vim.log.levels.INFO, {})
  end
end, {})

--Notes
usercmd('NewNote', function()
  local notes_dir = vim.fn.expand '$HOME/.notes/'
  local input_opts = {
    prompt = 'Create or edit note: ',
    default = notes_dir,
    completion = 'file',
  }
  userfn.clear_cmdline()
  userfn.mkdir(notes_dir)
  vim.ui.input(input_opts, function(new_file_path)
    userfn.clear_cmdline()
    if not new_file_path or new_file_path == notes_dir then
      return
    end
    if not userfn.is_filetype(new_file_path, { 'md', 'txt' }) then
      return vim.notify('Cannot create note: file must be of type "markdown" or "text"', vim.log.levels.WARN, {})
    end
    userfn.mkfile(new_file_path)
  end)
end, {})

--Test
usercmd('Test', function()
  -- print 'hello world'
  local status = vim.fn.systemlist { 'git', 'status', '--porcelain=v1' }
  print(vim.inspect(status))
end, {})
