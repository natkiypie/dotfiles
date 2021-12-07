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

-- Toggle floaterms
-- 1. create new terminal
-- 2. get channel number
-- 3. if terminal exists @ channel, show/hide terminal. if it doesn't, create it.
-- interesting: match("...", "...")

-- if foo is nil:
   -- 1. create new terminal
   -- 2. assign jobpid to foo
-- if foo && foo = jobpid && &channel > 0:
   -- 1. hide terminal
-- if foo && foo = jobpid && &channel < 0:
   -- 1. show terminal
-- if foo &&  && &channel < 0:

local set = vim.api.nvim_set_var
set('foo', nil)

function M.toggle_test ()
  local eval = vim.api.nvim_eval
  local bar = eval('foo')
  local baz = eval('&channel')

  if not bar then
    vim.cmd('FloatermNew --name=Terminal')
    local id = eval('jobpid(&channel)')
    set('foo', id)
  elseif bar and baz > 0 then
    vim.cmd('FloatermHide Terminal')
  else
    vim.cmd('FloatermToggle Terminal')
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
  '+=%=\\ %M\\ %f',
  '+=%=\\ %M\\ %t'
)
function M.toggle_path()
  local cmd = 'set tabline=|set tabline'..tp()
  vim.cmd(cmd)
end

return M
