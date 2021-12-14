local utils = require 'utils.helpers'

local G = {}

function G.close_win_on_last_buf()
  local eval = vim.api.nvim_eval
  local buffers = eval "len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))"
  if buffers == 1 then
    vim.cmd 'q'
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

-- Toggle mouse
local tm = utils.toggle('a', '')
function G.toggle_mouse()
  local cmd = 'set mouse=' .. tm()
  vim.cmd(cmd)
end

-- Toggle tabline file path
local tp = utils.toggle('+=%=\\ %G\\ %f', '+=%=\\ %G\\ %t')
function G.toggle_path()
  local cmd = 'set tabline=|set tabline' .. tp()
  vim.cmd(cmd)
end

return G
