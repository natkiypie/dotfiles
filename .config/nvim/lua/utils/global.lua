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
  if #vim.fn.tabpagebuflist() > minwin and vim.fn.winwidth '' < maxwidth then
    return vim.api.nvim_replace_termcodes(key, true, true, true)
  else
    return char
  end
end

function _G.toggle_term(cmd, key, char)
  if vim.fn.match(vim.fn.bufname '', cmd) > -1 then
    return vim.api.nvim_replace_termcodes(key, true, true, true)
  else
    return char
  end
end

function _G.peek_open(key, char)
  if require('peek').is_open() then
    return vim.api.nvim_replace_termcodes(key, true, true, true)
  else
    return char
  end
end
