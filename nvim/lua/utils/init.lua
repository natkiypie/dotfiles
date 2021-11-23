local M = {}

function M.close_float_win()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then
      vim.api.nvim_win_close(win, false)
    end end
  vim.cmd('bd')
end

function M.toggle(cmd, option, values)
  local result
  local eval = vim.api.nvim_eval
  if eval('&'..option) == values[1] then
    result = cmd..' '..option..'='..values[2]
  else
    result = cmd..' '..option..'='..values[1]
  end
  vim.cmd(result)
end

function M.toggle_path()
  local eval = vim.api.nvim_eval
  local path = eval('expand("%:p")')
  local status = eval('&statusline')
  if status == '' then
    vim.cmd[[ set statusline=..path ]]
    print(path)
  else
    vim.cmd[[
      set statusline=""
      echo ""
    ]]
  end
end

function M.bind_key(mode, keymap)
  local set_keymap = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }
  set_keymap(mode, keymap[1], keymap[2], opts)
end

function M.bind_normal_mode(keymaps)
  for _, keymap in ipairs(keymaps) do
    M.bind_key('n', keymap)
  end
end

function M.bind_insert_mode(keymaps)
  for _, keymap in ipairs(keymaps) do
    M.bind_key('i', keymap)
  end
end

function M.bind_visual_mode(keymaps)
  for _, keymap in ipairs(keymaps) do
    M.bind_key('v', keymap)
  end
end

function M.bind_command_mode(keymaps)
  for _, keymap in ipairs(keymaps) do
    M.bind_key('c', keymap)
  end
end

function M.bind_terminal_mode(keymaps)
  for _, keymap in ipairs(keymaps) do
    M.bind_key('t', keymap)
  end
end

return M
