
" Initialization {{{1
if exists('g:loaded_potent_motion_lib')
  finish
else
  let g:loaded_potent_motion_lib = 1
endif
"}}}

function! potent_motion_lib#MoveCursor(pattern, flags, syntaxName)
  call search('\v' . a:pattern, a:flags)

  if <SID>SyntaxMismatch(a:syntaxName)
    return potent_motion_lib#MoveCursor(a:pattern, a:flags, a:syntaxName)
  endif
endfunction

" Private functions {{{1
  function! s:SyntaxMismatch(syntaxName)
    let l:syntaxId = synID(line('.'), col('.'), 1)
    let l:syntaxName = synIDattr(l:syntaxId, 'name')

    return l:syntaxName != a:syntaxName
  endfunction
"}}}

