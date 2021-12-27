local M = {}

-- Adapted from: https://github.com/kutsan/dotfiles/blob/8b243cd065b90b3d05dbbc71392f1dba1282d777/.vim/autoload/kutsan/mappings.vim#L1-L52
function M.toggle()
  if vim.fn.has 'nvim' == 0 then
    return false
  end

  if not M.terminal then
    M.terminal = {
      loaded = false,
      originbufferid = nil,
      termbufferid = nil,
    }
  end

  M.terminal.on_exit = function()
    vim.cmd(string.gsub('buffer ogb', 'ogb', M.terminal.originbufferid))
    vim.cmd(string.gsub('Bclose! tbi', 'tbi', M.terminal.termbufferid))
    M.terminal = {
      loaded = false,
      originbufferid = nil,
      termbufferid = nil,
    }
  end

  if not M.terminal.loaded then
    M.terminal.originbufferid = vim.fn.bufnr ''
    vim.api.nvim_command 'enew'
    vim.fn.termopen('/bin/bash', M.terminal)
    M.terminal['loaded'] = true
    M.terminal['termbufferid'] = vim.fn.bufnr ''
    return true
  end

  if M.terminal.termbufferid == vim.fn.bufnr '' then
    vim.cmd(string.gsub('buffer ogb', 'ogb', M.terminal.originbufferid))
  else
    M.terminal.originbufferid = vim.fn.bufnr ''
    vim.cmd(string.gsub('buffer tbi', 'tbi', M.terminal.termbufferid))
  end
end
-- EOA

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
end

return M
