function _G.exec(a, b)
  vim.cmd(string.gsub(string.gsub('a b', 'b', b), 'a', a))
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
    and require('utils.table').contains_value({ 'TelescopePrompt' }, vim.bo.filetype) ~= true
  then
    return vim.api.nvim_replace_termcodes(key, true, true, true)
  else
    return char
  end
end

function _G.repl_vsplit(key, char)
  local minwin = 1
  local minheight = 29
  if vim.fn.winnr() > minwin and vim.fn.winheight '$' >= minheight then
    return vim.api.nvim_replace_termcodes(key, true, true, true)
  else
    return char
  end
end

function _G.repl(key, char)
  local buf = vim.fn.uniq(vim.fn.map(vim.fn.filter(vim.fn.getwininfo(), 'v:val.terminal'), 'v:val.bufnr'))
  local bufnr = require('utils.table').get_value(buf, 1)
  if bufnr then
    local bufname = vim.fn.bufname(bufnr)
    if string.find(bufname, 'node') then
      return vim.api.nvim_replace_termcodes(key, true, true, true)
    else
      return char
    end
  else
    return char
  end
end

function _G.issue_t_mode(cmd, key, char)
  if vim.fn.match(vim.fn.bufname '', cmd) > -1 then
    return vim.api.nvim_replace_termcodes(key, true, true, true)
  else
    return char
  end
end
