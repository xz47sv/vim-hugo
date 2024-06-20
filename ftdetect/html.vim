function! s:DetectGoTemplate()
  if findfile('.hugo_build.lock', '.;') !=# ''
    set ft=htmlhugo
  elseif search('\C\m{{-\?\s*end\s*-\?}}')
    set ft=htmlhugo
  elseif search('\m{{-\?\s*$\k\+\s*:=')
    set ft=htmlhugo
  elseif search('\C\m{{-\?\s*\.[A-Z]\?')
    set ft=htmlhugo
  endif
endfunction

au BufRead,BufNewFile *.html call <SID>DetectGoTemplate()
