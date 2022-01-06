local M = {}

local function cwd_suppressed(cwd, suppress_dirs)
  local cmd = string.gsub(string.gsub('! grep cwd suppress_dirs', 'suppress_dirs', suppress_dirs), 'cwd', cwd)
  return vim.fn.empty(vim.fn.system(cmd)) == 0
end

local function update_suppress_dirs(suppress_dirs)
  local sd_container = {}
  for _, dir in pairs(vim.fn.readfile(suppress_dirs)) do
    table.insert(sd_container, dir)
  end
  return sd_container
end

local function suppress_dir(cwd, suppress_dirs)
  vim.cmd(string.gsub('echo "cwd added to auto_session_suppress_dirs"', 'cwd', cwd))
  if vim.fn.filereadable(suppress_dirs) == 1 then
    local cmd = string.gsub(
      string.gsub('silent ! echo cwd >> suppress_dirs', 'suppress_dirs', suppress_dirs),
      'cwd',
      cwd
    )
    vim.cmd(cmd)
    vim.cmd 'silent DeleteSession'
    require('auto-session-config').auto_session_suppress_dirs = update_suppress_dirs(suppress_dirs)
  else
    vim.cmd(string.gsub('silent ! touch suppress_dirs', 'suppress_dirs', suppress_dirs))
    suppress_dir(cwd, suppress_dirs)
  end
end

local function sanction_dir(cwd, suppress_dirs)
  vim.cmd(string.gsub('echo "cwd removed from auto_session_suppress_dirs"', 'cwd', cwd))
  if vim.fn.filereadable(suppress_dirs) == 1 then
    local cmd = string.gsub(
      string.gsub(
        '! grep -v cwd suppress_dirs > ~/tmpfile ; mv ~/tmpfile suppress_dirs',
        'suppress_dirs',
        suppress_dirs
      ),
      'cwd',
      cwd
    )
    vim.fn.system(cmd)
    vim.cmd 'silent SaveSession'
    require('auto-session-config').auto_session_suppress_dirs = update_suppress_dirs(suppress_dirs)
  end
end

function M.get_suppress_dirs()
  local suppress_dirs = vim.fn.expand '~/.auto_session_suppress_dirs.txt'
  if vim.fn.filereadable(suppress_dirs) == 1 then
    return update_suppress_dirs(suppress_dirs)
  else
    vim.cmd(string.gsub('silent ! touch suppress_dirs', 'suppress_dirs', suppress_dirs))
    return update_suppress_dirs(suppress_dirs)
  end
end

function M.check_suppress_dirs(cmd, cwd, suppress_dirs)
  if cmd == 'suppress' then
    if cwd_suppressed(cwd, suppress_dirs) then
      vim.cmd(string.gsub('echo "cwd is already suppressed"', 'cwd', cwd))
    else
      suppress_dir(cwd, suppress_dirs)
    end
  elseif cmd == 'sanction' then
    if cwd_suppressed(cwd, suppress_dirs) then
      sanction_dir(cwd, suppress_dirs)
    else
      vim.cmd(string.gsub('echo "cwd is already sanctioned"', 'cwd', cwd))
    end
  end
end

function M.save_session_and_quit()
  vim.cmd 'echo ""'
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
  vim.cmd 'silent wa|qa'
end

return M
