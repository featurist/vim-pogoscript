if exists("b:ran_pogo_plugin")
  finish
endif

let b:ran_pogo_plugin = 1

setlocal smartindent
setlocal expandtab
setlocal iskeyword=@,_,48-57,$
