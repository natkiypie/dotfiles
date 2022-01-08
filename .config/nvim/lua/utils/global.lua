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
  if vim.fn.match(vim.fn.bufname '', cmd) > -1 then
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
  return vim.fn.uniq(vim.fn.map(vim.fn.filter(vim.fn.getwininfo(), 'v:val.terminal'), 'v:val.bufnr'))[1]
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