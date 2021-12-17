local utils = require 'utils.helpers'

local G = {}

function G.save_session()
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
  vim.cmd 'wa|qa'
end

function G.close_win_on_last_buf()
  local buffers = vim.fn.len(vim.fn.filter(vim.fn.range(1, vim.fn.bufnr '$'), 'buflisted(v:val)'))
  if buffers == 1 then
    if #vim.fn.tabpagebuflist() > 1 then
      vim.cmd 'q'
    else
      G.save_session()
    end
  else
    vim.cmd 'bd'
  end
end

function G.close_float_win()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= '' then
      vim.api.nvim_win_close(win, false)
    end
  end
  G.close_win_on_last_buf()
end

local tm = utils.toggle('a', '')
function G.toggle_mouse()
  local cmd = 'set mouse=' .. tm()
  vim.cmd(cmd)
end

function G.quote()
  local quote = vim.fn.expand '<cWORD>'
  local word = vim.fn.expand '<cword>'
  local marks = string.gsub(quote, word, '')
  if marks == "''" then
    word = '"' .. word .. '"'
    vim.cmd('normal! viWc' .. word)
  elseif marks == '""' then
    vim.cmd('normal! viWc' .. word)
  else
    word = "'" .. word .. "'"
    vim.cmd('normal! viWc' .. word)
  end
end

return G
