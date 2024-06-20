function! s:DetectGoTemplate() abort
  if findfile('.hugo_build.lock', '.;') !=# ''
    \|| search('\C\m{{-\?\s*end\s*-\?}}')
    \|| search('\m{{-\?\s*$\k\+\s*:=')
    \|| search('\C\m{{-\?\s*\.[A-Z]\?')

    set filetype=htmlhugo
  endif
endfunction

au BufRead,BufNewFile *.html call s:DetectGoTemplate()
