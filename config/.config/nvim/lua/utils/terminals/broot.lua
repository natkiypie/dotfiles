local M = {}

local command = 'broot'
local out_file_path = vim.fn.tempname()
local default_config_path = vim.fn.fnamemodify(vim.fn.expand '$XDG_CONFIG_HOME/broot/conf.hjson', ':p')
local nvim_config_path = vim.fn.fnamemodify(default_config_path, ':h') .. '/nvim.hjson'
local config_path = default_config_path .. ';' .. nvim_config_path

local function callback(code)
  if code == 0 then
    vim.cmd 'silent! Bclose!'
    vim.go.showtabline = require('utils.general').get_tabline()
    if require('utils.general').get_tabpage() == 1 then
      vim.cmd 'tabc'
    end
    vim.cmd(string.gsub('buffer originbufferid', 'originbufferid', M.originbufferid))
  end
  if vim.fn.filereadable(out_file_path) then
    for _, f in pairs(vim.fn.readfile(out_file_path)) do
      vim.cmd('edit ' .. f)
    end
    vim.fn.delete(out_file_path)
  end
end

function M.open()
  local currentPath = vim.fn.expand '.'
  local cmd = vim.fn.printf('%s --conf "%s" --out "%s" "%s"', command, config_path, out_file_path, currentPath)
  local on_exit = function(_, code)
    callback(code)
  end
  M.originbufferid = vim.fn.bufnr ''
  vim.go.showtabline = 0
  if require('utils.general').get_tabpage() == 1 then
    vim.cmd 'tab split'
  end
  vim.api.nvim_command 'enew'
  local opts = { name = 'broot', on_exit = on_exit }
  vim.fn.termopen(cmd, opts)
  vim.cmd 'startinsert'
end

return M
