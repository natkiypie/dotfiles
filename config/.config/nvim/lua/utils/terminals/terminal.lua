local M = {}

function M.open()
  vim.cmd 'terminal'
  vim.cmd 'startinsert'
end

function M.exit()
  vim.cmd 'stopinsert'
  vim.cmd 'silent! Bclose!'
end

local function callback(code)
  if code == 0 then
    vim.cmd 'silent! Bclose!'
    vim.api.nvim_input '2<C-o>'
  end
end

function M.issue(cmd)
  local on_exit = function(_, code)
    callback(code)
  end
  vim.api.nvim_command 'enew'
  local opts = { name = cmd, on_exit = on_exit }
  vim.fn.termopen(cmd, opts)
  vim.cmd 'startinsert'
end

return M
