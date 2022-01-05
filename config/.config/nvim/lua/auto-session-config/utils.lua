local M = {}

local function append_dir(suppress_dirs)
  local addition = {}
  for _, line in pairs(vim.fn.readfile(suppress_dirs)) do
    table.insert(addition, line)
  end
  return addition
end

function M.get_suppressed_dirs()
  local suppress_dirs = vim.fn.expand '~/.auto_session_suppress_dirs.txt'
  if vim.fn.filereadable(suppress_dirs) == 1 then
    return append_dir(suppress_dirs)
  else
    error(string.gsub('file does not exist', 'file', suppress_dirs))
  end
end

function M.suppress_dir()
  local cwd = vim.fn.getcwd()
  local suppress_dirs = vim.fn.expand '~/.auto_session_suppress_dirs.txt'
  if vim.fn.filereadable(suppress_dirs) == 1 then
    local cmd = string.gsub(
      string.gsub('silent ! echo cwd >> suppress_dirs', 'suppress_dirs', suppress_dirs),
      'cwd',
      cwd
    )
    vim.cmd(cmd)
    require('auto-session-config').auto_session_suppress_dirs = append_dir(suppress_dirs)
  else
    vim.cmd(string.gsub('silent ! touch suppress_dirs', 'suppress_dirs', suppress_dirs))
    M.suppress_dir()
  end
end

function M.sanction_dir()
  local cwd = vim.fn.getcwd()
  local suppress_dirs = vim.fn.expand '~/.auto_session_suppress_dirs.txt'
  if vim.fn.filereadable(suppress_dirs) == 1 then
    local cmd = string.gsub(
      string.gsub('! grep -v cwd suppress_dirs > tmpfile && mv tmpfile suppress_dirs', 'suppress_dirs', suppress_dirs),
      'cwd',
      cwd
    )
    vim.fn.system(cmd)
    require('auto-session-config').auto_session_suppress_dirs = append_dir(suppress_dirs)
  else
    error(string.gsub('file does not exist', 'file', suppress_dirs))
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
