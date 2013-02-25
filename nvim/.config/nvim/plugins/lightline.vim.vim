let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'background': 'dark',
      \ }

nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>

nnoremap <silent> <M-l> :call functions#MoveNext(1)<cr>
nnoremap <silent> <M-h> :call functions#MoveNext(0)<cr>
