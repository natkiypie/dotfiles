local M = {}

-- TODO: blacklist directories (/, /home/natkiypie, etc.)

function M.save_session()
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
