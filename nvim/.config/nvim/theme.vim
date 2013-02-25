if has('termguicolors')
    " fix bug for vim
    if !has('nvim')
        " if &term =~# '^screen\|^tmux'
        let &t_8f = "\e[38;2;%lu;%lu;%lum"
        let &t_8b = "\e[48;2;%lu;%lu;%lum"
        " endif
    endif
    " enable true color
    set termguicolors
endif

set background=dark
let g:one_allow_italics = 1

colorscheme one

