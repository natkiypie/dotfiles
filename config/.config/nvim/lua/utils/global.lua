function _G.exec_arg(a, b)
  vim.cmd(string.gsub(string.gsub('a b', 'b', b), 'a', a))
end

function _G.buffer(buffer)
  exec_arg('buffer', buffer)
end

function _G.wildmenu(key)
  return vim.fn.wildmenumode() == 1 and vim.api.nvim_replace_termcodes(key, true, true, true)
end

function _G.split(key, char)
  local minwin = 1
  local maxheight = 35
  if #vim.fn.tabpagebuflist() > minwin and vim.fn.winheight '' < maxheight then
    return vim.api.nvim_replace_termcodes(key, true, true, true)
  else
    return char
  end
end

function _G.vsplit(key, char)
  local minwin = 1
  local maxwidth = 147
  if #vim.fn.tabpagebuflist() > minwin and vim.fn.winwidth '' < maxwidth and not repl_alive() then
    return vim.api.nvim_replace_termcodes(key, true, true, true)
  else
    return char
  end
end

function _G.split_nav(key, char)
  if not repl_alive() then
    return vim.api.nvim_replace_termcodes(key, true, true, true)
  else
    return char
  end
end

function _G.toggle_term(cmd, key, char)
  if
    require('scripts.terminals.bash').terminals[cmd]
    and require('scripts.terminals.bash').terminals[cmd].channel == vim.api.nvim_eval '&channel'
  then
    return vim.api.nvim_replace_termcodes(key, true, true, true)
  else
    return char
  end
end

function _G.split_no_slime(key, char)
  if #vim.fn.tabpagebuflist() > 1 and not repl_alive() then
    error 'Close split before opening REPL'
    return char
  else
    return vim.api.nvim_replace_termcodes(key, true, true, true)
  end
end

function _G.repl_alive()
  local buf = vim.fn.uniq(vim.fn.map(vim.fn.filter(vim.fn.getwininfo(), 'v:val.terminal'), 'v:val.bufnr'))
  local bufnr = require('utils.table').get_value(buf, 1)
  return bufnr
end

function _G.repl_cmd(key, char)
  if repl_alive() then
    local bufname = vim.fn.bufname(repl_alive())
    if string.find(bufname, 'node') then
      return vim.api.nvim_replace_termcodes(key, true, true, true)
    else
      return char
    end
  else
    return char
  end
end
