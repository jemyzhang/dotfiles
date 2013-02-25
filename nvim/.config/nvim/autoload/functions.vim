
function functions#installed(plugName) abort
  return (isdirectory(g:plugs[a:plugName].dir) ? v:true : v:false)
endfunction

function functions#source_config(plugName) abort
  let l:config_path = g:plugins_config_root_path . a:plugName . ".vim"
  if filereadable(l:config_path)
    exec 'source' fnameescape(l:config_path)
  endif
endfunction

function! functions#MoveNext(dir) abort
  if tabpagenr('$') > 1
    if a:dir == 0
      exec 'tabprevious'
    else
      exec 'tabnext'
    endif
  else
    if a:dir == 0
      exec 'bprevious'
    else
      exec 'bnext'
    endif
  endif
endfunction

