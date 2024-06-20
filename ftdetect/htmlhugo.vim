function! s:DetectGoTemplate() abort
  for suffix in ['json', 'toml', 'yml', 'yaml']
    if findfile('hugo.' . suffix, '.;')
      set filetype=htmlhugo
      return
    endif
  endfor

  if findfile('.hugo_build.lock', '.;') !=# ''
    \|| search('\C\m{{-\?\s*end\s*-\?}}')
    \|| search('\m{{-\?\s*$\k\+\s*:=')
    \|| search('\C\m{{-\?\s*\.[A-Z]\?')

    set filetype=htmlhugo
  endif
endfunction

au BufRead,BufNewFile *.html call s:DetectGoTemplate()
