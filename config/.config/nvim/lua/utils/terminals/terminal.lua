local M = {}

function M.issue(cmd)
  if vim.fn.has 'nvim' == 0 then
    return false
  end

  local function initialize_terminal()
    M.terminal = {
      loaded = false,
      originbufferid = nil,
      termbufferid = nil,
    }
  end

  if not M.terminal then
    initialize_terminal()
  end

  M.terminal.on_exit = function(_, code)
    if code == 0 then
      exec('buffer', M.terminal.originbufferid)
      exec('Bclose!', M.terminal.termbufferid)
      initialize_terminal()
      require('utils.general').close_tab()
    end
  end

  if not M.terminal.loaded then
    require('utils.general').split_tab()
    M.terminal.originbufferid = vim.fn.bufnr ''
    vim.api.nvim_command 'enew'
    vim.fn.termopen(cmd, M.terminal)
    M.terminal['loaded'] = true
    M.terminal['termbufferid'] = vim.fn.bufnr ''
    return true
  end

  if M.terminal.termbufferid == vim.fn.bufnr '' then
    require('utils.general').close_tab()
    exec('buffer', M.terminal.originbufferid)
  else
    require('utils.general').split_tab()
    M.terminal.originbufferid = vim.fn.bufnr ''
    exec('buffer', M.terminal.termbufferid)
  end
end

return M
