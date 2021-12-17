local helpers = require 'utils.helpers'

local M = {}

local function bind_key(mode, keymap)
  local set_keymap = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }
  set_keymap(mode, keymap[1], keymap[2], opts)
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

function M.replace_termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.wildmenu(key)
  return vim.fn.wildmenumode() == 1 and M.replace_termcodes(key)
end

function _G.split(key, char)
  local minwin = 1
  local maxheight = 33
  local wins = #vim.fn.tabpagebuflist()
  local winh = vim.fn.winheight '$'
  if wins > minwin and winh < maxheight then
    return M.replace_termcodes(key)
  else
    return char
  end
end

function _G.vsplit(key, char)
  local minwin = 1
  local filetype = vim.bo.filetype
  local blacklist = { 'TelescopePrompt' }
  local maxwidth = 147
  local wins = #vim.fn.tabpagebuflist()
  local winw = vim.fn.winwidth '$'
  if wins > minwin and winw < maxwidth and helpers.table_contains_value(blacklist, filetype) ~= true then
    return M.replace_termcodes(key)
  else
    return char
  end
end

function _G.repl_vsplit(key, char)
  local minwin = 1
  local minheight = 33
  local winnr = vim.fn.winnr()
  local winh = vim.fn.winheight '$'
  if winnr > minwin and winh > minheight then
    return M.replace_termcodes(key)
  else
    return char
  end
end

local function bind_expr_key(mode, keymap)
  local set_keymap = vim.api.nvim_set_keymap
  local opts = { expr = true, noremap = true }
  set_keymap(mode, keymap[1], keymap[2], opts)
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
