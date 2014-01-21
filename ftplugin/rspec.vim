let b:pattern = '<it\s'

nnoremap <silent> <buffer> ]f :call potent_motion_lib#MoveCursor(b:pattern, '', 'rubyDoBlock')<CR>
nnoremap <silent> <buffer> [f :call potent_motion_lib#MoveCursor(b:pattern, 'b', 'rubyDoBlock')<CR>
