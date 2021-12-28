local M = {}

function M.issue(cmd)
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

  M.terminal.on_exit = function(_, code)
    if code == 0 then
      vim.cmd(string.gsub('buffer originbufferid', 'originbufferid', M.terminal.originbufferid))
      vim.cmd(string.gsub('Bclose! termbufferid', 'termbufferid', M.terminal.termbufferid))
      M.terminal = {
        loaded = false,
        originbufferid = nil,
        termbufferid = nil,
      }
    end
    vim.go.showtabline = require('utils.general').get_tabline()
    if require('utils.general').get_tabpage() == 1 then
      vim.cmd 'tabc'
    end
  end

  if not M.terminal.loaded then
    vim.go.showtabline = 0
    if require('utils.general').get_tabpage() == 1 then
      vim.cmd 'tab split'
    end
    M.terminal.originbufferid = vim.fn.bufnr ''
    vim.api.nvim_command 'enew'
    vim.fn.termopen(cmd, M.terminal)
    M.terminal['loaded'] = true
    M.terminal['termbufferid'] = vim.fn.bufnr ''
    return true
  end

  if M.terminal.termbufferid == vim.fn.bufnr '' then
    vim.go.showtabline = require('utils.general').get_tabline()
    if require('utils.general').get_tabpage() == 1 then
      vim.cmd 'tabc'
    end
    vim.cmd(string.gsub('buffer originbufferid', 'originbufferid', M.terminal.originbufferid))
  else
    vim.go.showtabline = 0
    if require('utils.general').get_tabpage() == 1 then
      vim.cmd 'tab split'
    end
    M.terminal.originbufferid = vim.fn.bufnr ''
    vim.cmd(string.gsub('buffer termbufferid', 'termbufferid', M.terminal.termbufferid))
  end
end

return M
