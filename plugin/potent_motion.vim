function! PotentMotionMap(mappable_key, pattern, syntaxName)
  let b:pattern = a:pattern
  let b:syntaxName = a:syntaxName

  execute 'nnoremap <silent> <buffer> ]' . a:mappable_key . " :call potent_motion_lib#MoveCursor('" . b:pattern . "', '', '" . b:syntaxName . "')<CR>"
  execute 'nnoremap <silent> <buffer> [' . a:mappable_key . " :call potent_motion_lib#MoveCursor('" . b:pattern . "', 'b', '" . b:syntaxName . "')<CR>"

  execute "onoremap <silent> a" . a:mappable_key . " :<C-U>call potent_motion_lib#SelectAround('" . a:mappable_key . "')<CR>"
  execute "vnoremap <silent> a" . a:mappable_key . " :<C-U>call potent_motion_lib#SelectAround('" . a:mappable_key . "')<CR>"

  execute "onoremap <silent> i" . a:mappable_key . " :<C-U>call potent_motion_lib#SelectWithin('" . a:mappable_key . "')<CR>"
  execute "vnoremap <silent> i" . a:mappable_key . " :<C-U>call potent_motion_lib#SelectWithin('" . a:mappable_key . "')<CR>"
endfunction
