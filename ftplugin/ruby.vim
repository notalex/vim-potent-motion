" This ftplugin is called when minitest filetype is being set.
if &ft == 'ruby'
  call PotentMotionMap('f', '<def\s', 'rubyDefine')
  call PotentMotionMap('c', '<class\s', 'rubyClass')
endif
