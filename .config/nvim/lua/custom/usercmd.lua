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
  userfn.clear_prompt()
  userfn.mkdir(notes_dir)
  vim.ui.input(input_opts, function(new_file_path)
    userfn.clear_prompt()
    if not new_file_path or new_file_path == notes_dir then
      return
    end
    if not userfn.check_file_ext(new_file_path, '.md') and not userfn.check_file_ext(new_file_path, '.txt') then
      return vim.notify('Cannot create note: file must be of type "markdown" or "text"', vim.log.levels.WARN, {})
    end
    userfn.touch(new_file_path)
  end)
end, {})
