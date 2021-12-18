local M = {}

local function bind_key(mode, keymap)
  vim.api.nvim_set_keymap(mode, keymap[1], keymap[2], { noremap = true, silent = true })
end

function M.bind_normal_mode(keymaps)
  for _, keymap in ipairs(keymaps) do
    bind_key('n', keymap)
  end
end

function M.bind_insert_mode(keymaps)
  for _, keymap in ipairs(keymaps) do
    bind_key('i', keymap)
  end
end

function M.bind_visual_mode(keymaps)
  for _, keymap in ipairs(keymaps) do
    bind_key('v', keymap)
  end
end

function M.bind_x_mode(keymaps)
  for _, keymap in ipairs(keymaps) do
    bind_key('x', keymap)
  end
end

function M.bind_command_mode(keymaps)
  for _, keymap in ipairs(keymaps) do
    bind_key('c', keymap)
  end
end

function M.bind_terminal_mode(keymaps)
  for _, keymap in ipairs(keymaps) do
    bind_key('t', keymap)
  end
end

function _G.wildmenu(key)
  return vim.fn.wildmenumode() == 1 and vim.api.nvim_replace_termcodes(key, true, true, true)
end

function _G.split(key, char)
  local minwin = 1
  local maxheight = 33
  if #vim.fn.tabpagebuflist() > minwin and vim.fn.winheight '$' < maxheight then
    return vim.api.nvim_replace_termcodes(key, true, true, true)
  else
    return char
  end
end

function _G.vsplit(key, char)
  local minwin = 1
  local maxwidth = 147
  if
    #vim.fn.tabpagebuflist() > minwin
    and vim.fn.winwidth '$' < maxwidth
    and require('utils.helpers').table_contains_value({ 'TelescopePrompt' }, vim.bo.filetype) ~= true
  then
    return vim.api.nvim_replace_termcodes(key, true, true, true)
  else
    return char
  end
end

function _G.repl_vsplit(key, char)
  local minwin = 1
  local minheight = 33
  if vim.fn.winnr() > minwin and vim.fn.winheight '$' > minheight then
    return vim.api.nvim_replace_termcodes(key, true, true, true)
  else
    return char
  end
end

local function bind_expr_key(mode, keymap)
  vim.api.nvim_set_keymap(mode, keymap[1], keymap[2], { expr = true, noremap = true })
end

function M.bind_expr_normal_mode(keymaps)
  for _, keymap in ipairs(keymaps) do
    bind_expr_key('n', keymap)
  end
end

function M.bind_expr_command_mode(keymaps)
  for _, keymap in ipairs(keymaps) do
    bind_expr_key('c', keymap)
  end
end

function M.bind_expr_terminal_mode(keymaps)
  for _, keymap in ipairs(keymaps) do
    bind_expr_key('t', keymap)
  end
end

return M
