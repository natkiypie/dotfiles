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
