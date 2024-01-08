local usercmd = vim.api.nvim_create_user_command

--File Manipulation
usercmd('Cppath', function()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

--Notes
local notes_dir = vim.fn.expand '$HOME/.notes/'

local function clear_prompt()
  if vim.opt.cmdheight._value ~= 0 then
    vim.cmd 'normal! :'
  end
end

local input_opts = {
  prompt = 'New note: ',
  default = notes_dir,
  completion = 'file',
}

usercmd('NewNote', function()
  vim.ui.input(input_opts, function(new_file_path)
    clear_prompt()
    if not new_file_path or new_file_path == notes_dir then
      return
    end
    if vim.fn.filereadable(new_file_path) == 1 then
      vim.notify('Cannot create note: file already exists', vim.log.levels.WARN, {})
      return
    end
    if string.match(new_file_path, '.md') == nil and string.match(new_file_path, '.txt') == nil then
      vim.notify('Cannot create note: file must be of type "markdown" or "text"', vim.log.levels.WARN, {})
      return
    end
    vim.cmd('silent exec "!touch ' .. new_file_path .. '"')
    vim.cmd('edit' .. new_file_path)
    vim.cmd 'startinsert'
  end)
end, {})
