scriptencoding utf-8

if exists('g:no_vim_fancy_text') || !has('conceal') || &enc != 'utf-8'
  finish
endif

syntax match jsFancyOperator "!=" conceal cchar=≠
syntax match jsFancyOperator "===" conceal cchar=≡
syntax match jsFancyOperator "!==" conceal cchar=≢
syntax match jsFancyOperator "<=" conceal cchar=≤
syntax match jsFancyOperator ">=" conceal cchar=≥
syntax match jsFancyOperator "->" conceal cchar=→
syntax match jsFancyOperator "=>" conceal cchar=⇒
syntax match jsFancyOperator "||" conceal cchar=∥

hi! link jsFancyOperator Operator
hi! link Conceal Operator

setlocal concealcursor=nivc
setlocal conceallevel=1
