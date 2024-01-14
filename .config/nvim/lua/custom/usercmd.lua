local usercmd = vim.api.nvim_create_user_command
local userfn = require 'custom.userfn'

--File Manipulation
usercmd('Cppath', function()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard')
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
  if not userfn.is_git_repo() then
    return
  end
  local branch = userfn.get_branch()
  if branch == 'main' then
    vim.cmd [[
      Git merge update
      Git push
    ]]
  else
    return vim.notify('Not on main', vim.log.levels.WARN, {})
  end
end, {})
