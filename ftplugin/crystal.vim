let s:file_name = expand('%:p')

if strlen(matchstr(s:file_name, '_spec.cr$'))
  call PotentMotionMap('f', '<it\s', 'rubyDoBlock')
  call PotentMotionMap('d', '^\s*describe\s', 'rubyDoBlock')
else
  call PotentMotionMap('f', '<def\s', 'rubyDefine')
  call PotentMotionMap('c', '<class\s', 'rubyClass')
endif
