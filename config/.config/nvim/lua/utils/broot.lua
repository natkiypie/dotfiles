local M = {}
local broot_command = 'broot'
local out_file_path = vim.fn.tempname()
local broot_default_config_path = vim.fn.fnamemodify(vim.fn.expand '$XDG_CONFIG_HOME/broot/conf.hjson', ':p')
local broot_nvim_config_path = vim.fn.fnamemodify(broot_default_config_path, ':h') .. '/nvim.hjson'
local broot_config_path = broot_default_config_path .. ';' .. broot_nvim_config_path

local function broot_callback(code)
  if code == 0 then
    vim.cmd 'silent! Bclose!'
  end
  if vim.fn.filereadable(out_file_path) then
    for _, f in pairs(vim.fn.readfile(out_file_path)) do
      vim.cmd('edit ' .. f)
    end
    vim.fn.delete(out_file_path)
  end
end

function M.open_broot()
  local currentPath = vim.fn.expand '.'

  local cmd = vim.fn.printf(
    '%s --conf "%s" --out "%s" "%s"',
    broot_command,
    broot_config_path,
    out_file_path,
    currentPath
  )
  local on_exit = function(_, code)
    broot_callback(code)
  end
  vim.api.nvim_command 'enew'
  local opts = { name = 'broot', on_exit = on_exit }
  vim.fn.termopen(cmd, opts)
  vim.cmd 'startinsert'
end

return M
