local M = {}

function M.close_win_on_last_buf()
  local eval = vim.api.nvim_eval
  local buffers = eval("len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))")
  if buffers == 1 then
    vim.cmd('q')
  else
    vim.cmd('bd')
  end
end

function M.close_float_win()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then
      vim.api.nvim_win_close(win, false)
    end end
  M.close_win_on_last_buf()
end

function M.toggle (a, b)
  local x = b
  return function ()
    if x == a then x = b else x = a end
    return x
  end
end

-- Toggle mouse
local tm = M.toggle('a', '')
function M.toggle_mouse()
  local cmd = 'set mouse='..tm()
  vim.cmd(cmd)
end

-- Toggle floaterm winsize
local tf = M.toggle(
  '--width=0.99 --height=0.99',
  '--width=0.6 --height=0.6'
)
function M.toggle_ft_winsize()
  local cmd = 'FloatermUpdate '..tf()
  vim.cmd(cmd)
end

-- Toggle tabline file path
local tp = M.toggle(
  '+=%=\\ %t\\ %M',
  '+=%=\\ %f\\ %M'
)
function M.toggle_path()
  local cmd = 'set tabline=|set tabline'..tp()
  vim.cmd(cmd)
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
