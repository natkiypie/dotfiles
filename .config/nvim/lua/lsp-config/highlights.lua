vim.cmd [[
  hi FloatBorder guibg=none guifg=#a9b1d6
  hi NormalFloat guibg=none
  hi Pmenu guibg=none
  hi PmenuSbar guibg=None
  hi PmenuThumb guibg=None
  hi PmenuSel guibg=blue
  hi DiagnosticVirtualTextError guibg=none
  hi DiagnosticVirtualTextWarn guibg=none
  hi DiagnosticVirtualTextInfo guibg=none
  hi DiagnosticVirtualTextHint guibg=none
]]

vim.cmd [[
  highlight DiagnosticLineNrError guibg=#51202A guifg=#FF0000
  highlight DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500
  highlight DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF
  highlight DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF
  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]