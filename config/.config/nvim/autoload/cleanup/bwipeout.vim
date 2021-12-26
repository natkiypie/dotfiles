" Adapted from: https://vi.stackexchange.com/questions/27104/efficient-way-of-cleaning-up-the-buffer-list

" Wipe all deleted (unloaded & unlisted) or all unloaded buffers
function! cleanup#bwipeout#(listed) abort
    let l:buffers = filter(getbufinfo(), {_, v -> !v.loaded && (!v.listed || a:listed)})
    if !empty(l:buffers)
        execute 'bwipeout' join(map(l:buffers, {_, v -> v.bufnr}))
    endif
endfunction
