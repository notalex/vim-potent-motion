let b:pattern = '<it\s'

nnoremap <silent> <buffer> ]f :call potent_motion_lib#MoveCursor(b:pattern, '', 'rubyDoBlock')<CR>
nnoremap <silent> <buffer> [f :call potent_motion_lib#MoveCursor(b:pattern, 'b', 'rubyDoBlock')<CR>

onoremap <silent> af :<C-U>call potent_motion_lib#SelectAround()<CR>
vnoremap <silent> af :<C-U>call potent_motion_lib#SelectAround()<CR>

onoremap <silent> if :<C-U>call potent_motion_lib#SelectWithin()<CR>
vnoremap <silent> if :<C-U>call potent_motion_lib#SelectWithin()<CR>
