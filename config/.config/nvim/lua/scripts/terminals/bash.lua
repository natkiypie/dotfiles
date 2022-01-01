local M = {}

local function initialize_terminal()
  M.terminal = {
    originbufferid = nil,
    termbufferid = nil,
  }
end

local function open()
  if vim.fn.has 'nvim' == 0 then
    return false
  end

  initialize_terminal()

  M.terminal.on_exit = function(_, code)
    if code == 0 or code == 130 then
      buffer(M.terminal.originbufferid)
      exec_arg('Bclose!', M.terminal.termbufferid)
      M.terminal = nil
      require('utils.general').close_tab()
    end
  end

  require('utils.general').split_tab()
  M.terminal.originbufferid = vim.fn.bufnr ''
  vim.api.nvim_command 'enew'
  vim.fn.termopen('/bin/bash', M.terminal)
  vim.bo.ft = 'terminal'
  vim.cmd 'startinsert'
  M.terminal['termbufferid'] = vim.fn.bufnr ''
end

function M.toggle()
  if not M.terminal then
    open()
  else
    if M.terminal.termbufferid == vim.fn.bufnr '' then
      require('utils.general').close_tab()
      buffer(M.terminal.originbufferid)
    else
      require('utils.general').split_tab()
      M.terminal.originbufferid = vim.fn.bufnr ''
      buffer(M.terminal.termbufferid)
      vim.cmd 'startinsert'
    end
  end
end

return M
