function! PotentMotionMap(pattern, syntaxName)
  let b:pattern = a:pattern
  let b:syntaxName = a:syntaxName

  nnoremap <silent> <buffer> ]f :call potent_motion_lib#MoveCursor(b:pattern, '', b:syntaxName)<CR>
  nnoremap <silent> <buffer> [f :call potent_motion_lib#MoveCursor(b:pattern, 'b', b:syntaxName)<CR>

  onoremap <silent> af :<C-U>call potent_motion_lib#SelectAround()<CR>
  vnoremap <silent> af :<C-U>call potent_motion_lib#SelectAround()<CR>

  onoremap <silent> if :<C-U>call potent_motion_lib#SelectWithin()<CR>
  vnoremap <silent> if :<C-U>call potent_motion_lib#SelectWithin()<CR>
endfunction
