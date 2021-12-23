-- TODO:
----

local M = {}

function M.open()
  vim.cmd 'terminal'
  vim.cmd 'startinsert'
end

function M.close()
  vim.cmd 'silent! Bclose!'
end

return M
