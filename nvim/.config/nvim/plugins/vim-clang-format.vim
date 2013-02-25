let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format_on_insert_leave = 0
let g:clang_format#auto_format = 0
let g:clang_format#code_style = 'llvm'

let g:clang_format#style_options = {
            \ "IndentWidth" : 2}


autocmd FileType c,cpp nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><silent>= :ClangFormat<CR>

