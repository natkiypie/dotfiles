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
  local minheight = 29
  if vim.fn.winnr() > minwin and vim.fn.winheight '$' >= minheight then
    return vim.api.nvim_replace_termcodes(key, true, true, true)
  else
    return char
  end
end

function _G.no_q(key, char)
  if vim.api.nvim_eval '&channel' ~= 0 then
    if
      require('utils.helpers').table_contains_value(
        { 'htop', 'Glow', 'LazyGit' },
        require('utils.helpers').get_nested_table_value(require('floaterm-config.utils').ft_table, 'name')
      )
    then
      return vim.api.nvim_replace_termcodes(key, true, true, true)
    else
      return char
    end
  end
end

function _G.repl(key, char)
  local buf = vim.fn.uniq(vim.fn.map(vim.fn.filter(vim.fn.getwininfo(), 'v:val.terminal'), 'v:val.bufnr'))
  local bufnr = require('utils.helpers').get_table_value(buf, 1)
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
