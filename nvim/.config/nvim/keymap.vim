nnoremap <silent> <M-a> :Ag <c-r><c-w><cr>

autocmd FileType c,cpp nnoremap <buffer><leader>f :%!clang-format<CR>
autocmd FileType c,cpp vnoremap <buffer><leader>= :!clang-format<CR>
