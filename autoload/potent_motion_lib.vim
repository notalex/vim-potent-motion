" Initialization {{{1
if exists('g:loaded_potent_motion_lib')
  finish
else
  let g:loaded_potent_motion_lib = 1
endif
"}}}

function! potent_motion_lib#MoveCursor(pattern, flags, syntaxName)
  call search('\v' . a:pattern, a:flags . 's')

  if <SID>SyntaxMismatch(a:syntaxName)
    try
      return potent_motion_lib#MoveCursor(a:pattern, a:flags, a:syntaxName)
    catch /Function call depth is higher/
      echom 'Could not find pattern'
    endtry
  endif
endfunction

function! potent_motion_lib#SelectAround(mappable_key)
  call <SID>GotoSectionStart(a:mappable_key)

  let l:total_lines = <SID>MoveToEndAndReturnTotalLines()

  if <SID>NextLineBlank()
    let l:total_lines += 1
  endif

  normal g%
  call <SID>SelectLines(l:total_lines)
endfunction

function! potent_motion_lib#SelectWithin(mappable_key)
  call <SID>GotoSectionStart(a:mappable_key)

  let l:inner_lines = <SID>MoveToEndAndReturnTotalLines() - 2

  normal g%
  " Ensure that cursor remains where the deleted section began.
  normal! j^
  call <SID>SelectLines(l:inner_lines)
endfunction

" Private functions {{{1
  function! s:SyntaxMismatch(syntaxName)
    let l:syntaxId = synID(line('.'), col('.'), 1)
    let l:syntaxName = synIDattr(l:syntaxId, 'name')

    return l:syntaxName != a:syntaxName
  endfunction

  function! s:SelectLines(quantity)
    normal! V

    if a:quantity
      execute 'normal! ' . a:quantity . 'j'
    endif
  endfunction

  function! s:GotoSectionStart(mappable_key)
    execute 'normal j[' . a:mappable_key
  endfunction

  function! s:MoveToEndAndReturnTotalLines()
    let l:start_line_number = line('.')
    normal g%
    let l:end_line_number = line('.')

    return l:end_line_number - l:start_line_number
  endfunction

  function! s:NextLineBlank()
    let l:next_line_number = line('.') + 1
    let l:next_line_contents = getline(l:next_line_number)

    return !strlen(l:next_line_contents)
  endfunction
"}}}
