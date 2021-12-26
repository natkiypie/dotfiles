" Adapted from: https://github.com/kutsan/dotfiles/blob/8b243cd065b90b3d05dbbc71392f1dba1282d777/.vim/autoload/kutsan/mappings.vim#L1-L52

function! terminal#toggle#() abort
	if !has('nvim')
		return v:false
	endif

	if !exists('g:terminal')
		let g:terminal = {
			\ 'loaded': v:null,
			\ 'termbufferid': v:null,
			\ 'originbufferid': v:null
		\ }
	endif

	function! g:terminal.on_exit(jobid, data, event)
		silent execute 'buffer' g:terminal.originbufferid
		silent execute 'Bclose!' g:terminal.termbufferid

		let g:terminal = {
			\ 'loaded': v:null,
			\ 'termbufferid': v:null,
			\ 'originbufferid': v:null
		\ }
	endfunction

	" Create terminal and finish.
	if !g:terminal.loaded
		let g:terminal.originbufferid = bufnr('')

		enew | call termopen(&shell, g:terminal)
		let g:terminal.loaded = v:true
		let g:terminal.termbufferid = bufnr('')

		return v:true
	endif

	" Go back to origin buffer if current buffer is terminal.
	if g:terminal.termbufferid ==# bufnr('')
		silent execute 'buffer' g:terminal.originbufferid

	" Launch terminal buffer and start insert mode.
	else
		let g:terminal.originbufferid = bufnr('')
		silent execute 'buffer' g:terminal.termbufferid
	endif
endfunction
