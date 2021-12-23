local M = {}

local function callback(code)
  if code == 0 then
    vim.cmd 'silent! Bclose!'
  end
end

function M.open()
  local on_exit = function(_, code)
    callback(code)
  end
  vim.api.nvim_command 'enew'
  local opts = { name = 'glow', on_exit = on_exit }
  vim.fn.termopen('glow', opts)
  vim.cmd 'startinsert'
end

return M
