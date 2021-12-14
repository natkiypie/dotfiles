local M = {}

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

function M.bind_x_mode(keymaps)
  for _, keymap in ipairs(keymaps) do
    M.bind_key('x', keymap)
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

function M.replace_termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.wildm(key)
  return vim.fn.wildmenumode() == 1 and M.replace_termcodes(key)
end

function _G.vsplit_term(key)
  local eval = vim.api.nvim_eval
  local win = eval 'winnr()'
  local winh = eval 'winheight("$")'
  if win > 1 and winh > 33 then
    return M.replace_termcodes(key)
  else
    return '<'
  end
end

function M.bind_expr_key(mode, keymap)
  local set_keymap = vim.api.nvim_set_keymap
  local opts = { expr = true, noremap = true }
  set_keymap(mode, keymap[1], keymap[2], opts)
end

function M.bind_expr_command_mode(keymaps)
  for _, keymap in ipairs(keymaps) do
    M.bind_expr_key('c', keymap)
  end
end

function M.bind_expr_terminal_mode(keymaps)
  for _, keymap in ipairs(keymaps) do
    M.bind_expr_key('t', keymap)
  end
end

return M
