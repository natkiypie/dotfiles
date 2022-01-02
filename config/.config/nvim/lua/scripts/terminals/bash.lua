local M = {}

M.terminals = {}

local function check_support()
  if vim.fn.has 'nvim' == 0 then
    return false
  end
end

local function add_terminal(cmd)
  local terminal = {
    channel = nil,
    originbufferid = nil,
    termbufferid = nil,
  }
  M.terminals[cmd] = terminal
end

local function open(cmd)
  local on_exit = function(_, code)
    if code == 0 or code == 130 then
      buffer(M.terminals[cmd].originbufferid)
      exec_arg('Bclose!', M.terminals[cmd].termbufferid)
      M.terminals[cmd] = nil
      require('utils.general').close_tab()
    end
  end
  M.terminals[cmd].originbufferid = vim.fn.bufnr ''
  vim.api.nvim_command 'enew'
  vim.fn.termopen(cmd, { on_exit = on_exit })
  vim.bo.ft = 'terminal'
  M.terminals[cmd].channel = vim.api.nvim_eval '&channel'
  M.terminals[cmd].termbufferid = vim.fn.bufnr ''
  vim.cmd 'startinsert'
end

local function initiate(cmd)
  check_support()
  add_terminal(cmd)
  require('utils.general').split_tab()
  open(cmd)
end

local function toggle(cmd)
  if M.terminals[cmd].termbufferid == vim.fn.bufnr '' then
    require('utils.general').close_tab()
    buffer(M.terminals[cmd].originbufferid)
  else
    require('utils.general').split_tab()
    M.terminals[cmd].originbufferid = vim.fn.bufnr ''
    buffer(M.terminals[cmd].termbufferid)
    vim.cmd 'startinsert'
  end
end

function M.start(cmd)
  if M.terminals[cmd] ~= nil then
    toggle(cmd)
  else
    initiate(cmd)
  end
end

return M
