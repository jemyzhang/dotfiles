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

if exists("g:neovide")
set guifont=Source\ Code\ Pro:h10
set linespace=0
let g:neovide_scale_factor = 1.0
let g:neovide_text_gamma = 0.0
let g:neovide_text_contrast = 0.5
let g:neovide_padding_top = 0
let g:neovide_padding_bottom = 0
let g:neovide_padding_right = 0
let g:neovide_padding_left = 0
let g:neovide_opacity = 0.0
let g:transparency = 0.8
"let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))
"let g:neovide_title_background_color = "green"
"let g:neovide_title_text_color = "pink"
let g:neovide_window_blurred = v:true
let g:neovide_floating_shadow = v:true
let g:neovide_floating_z_height = 10
let g:neovide_light_angle_degrees = 45
let g:neovide_light_radius = 5
let g:neovide_floating_corner_radius = 0.0
let g:neovide_normal_opacity = 0.8
let g:neovide_theme = 'auto'
endif
