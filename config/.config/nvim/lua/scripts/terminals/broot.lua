local M = {}

local command = 'broot'
local out_file_path = vim.fn.tempname()
local default_config_path = vim.fn.fnamemodify(vim.fn.expand '$XDG_CONFIG_HOME/broot/conf.toml', ':p')
local nvim_config_path = vim.fn.fnamemodify(default_config_path, ':h') .. '/nvim.toml'
local config_path = default_config_path .. ';' .. nvim_config_path

local function close()
  vim.cmd 'silent! Bclose!'
  require('utils.general').close_tab()
  buffer(M.originbufferid)
end

local function edit()
  for _, f in pairs(vim.fn.readfile(out_file_path)) do
    vim.cmd('edit ' .. f)
  end
  vim.fn.delete(out_file_path)
end

local function exit(_, code)
  if code == 0 then
    close()
  end
  if vim.fn.filereadable(out_file_path) then
    edit()
  end
end

local function cmd()
  local currentPath = vim.fn.expand '.'
  return vim.fn.printf('%s --conf "%s" --out "%s" "%s"', command, config_path, out_file_path, currentPath)
end

function M.open()
  M.originbufferid = vim.fn.bufnr ''
  require('utils.general').split_tab()
  vim.api.nvim_command 'enew'
  vim.fn.termopen(cmd(), { name = 'broot', on_exit = exit })
  vim.cmd 'startinsert'
end

return M
