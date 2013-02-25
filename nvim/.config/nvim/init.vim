let g:vim_root_path = fnamemodify($MYVIMRC, ':h') . '/'
let g:plugins_config_root_path = g:vim_root_path . "plugins/"
let g:cache_root_path = $HOME . '/.cache/nvim/'
let g:plugins_install_path = g:cache_root_path . "plugins/"
let g:undo_dir = g:cache_root_path . 'undo/'

command! -nargs=1 LoadScript exec 'source ' . g:vim_root_path . '<args>'

LoadScript base.vim
LoadScript plugins.vim
LoadScript keymap.vim
LoadScript theme.vim

for [plugName, _] in items(g:plugs)
  if functions#installed(plugName)
    call functions#source_config(plugName)
  endif
endfor
