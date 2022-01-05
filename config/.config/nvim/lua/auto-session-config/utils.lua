local M = {}

local function append_dir(suppressed_dirs)
  local addition = {}
  for _, line in pairs(vim.fn.readfile(suppressed_dirs)) do
    table.insert(addition, line)
  end
  return addition
end

function M.get_suppressed_dirs()
  local suppressed_dirs = vim.fn.expand '~/.auto_session_suppress_dirs.txt'
  if vim.fn.filereadable(suppressed_dirs) == 1 then
    return append_dir(suppressed_dirs)
  else
    error(string.gsub('file does not exist', 'file', suppressed_dirs))
  end
end

function M.suppress_dir()
  local cwd = vim.fn.getcwd()
  local suppressed_dirs = vim.fn.expand '~/.auto_session_suppress_dirs.txt'
  if vim.fn.filereadable(suppressed_dirs) == 1 then
    vim.fn.system(string.gsub(string.gsub('! echo cwd >> file', 'file', suppressed_dirs), 'cwd', cwd))
    require('auto-session-config').auto_session_suppress_dirs = append_dir(suppressed_dirs)
  else
    error(string.gsub('file does not exist', 'file', suppressed_dirs))
  end
end

function M.save_session_and_quit()
  local choice = vim.fn.confirm(
    'Before you quit, would you like to save the session?',
    '&Save\n&Restore previous session\n&Delete all sessions\n&Abort'
  )
  if choice == 1 then
    vim.cmd 'SaveSession'
  elseif choice == 2 then
    vim.cmd 'RestoreSession'
  elseif choice == 3 then
    vim.cmd 'DeleteSession'
  else
    return
  end
  vim.cmd 'wa|qa'
end


return M
