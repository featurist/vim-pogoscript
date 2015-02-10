if exists("b:ran_pogo_plugin")
  finish
endif

let b:ran_pogo_plugin = 1

setlocal smartindent
setlocal expandtab
setlocal iskeyword=@,_,48-57,$

nnoremap gf :call <SID>OpenFile()<CR>

if exists("g:ran_pogo_plugin")
  finish
endif

let g:ran_pogo_plugin = 1

command PogoCompile :call <SID>PogoCompile()

function! s:PogoCompile()
  exec "enew"
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  exec "r!pogo -c < #"
  exec "setf javascript"
  normal ggdd
  setlocal nomodifiable
endfunction

function! s:OpenFile()
  let fn = expand('<cfile>')
  let path = expand('%:h') . '/' . fn

  if match(path, "\\.\\+/") > 0 && match(path, "\\.[a-zA-Z0-9]\\+$") == -1
    let pogo = path . '.pogo'
    if filereadable(pogo)
      exec "e " . pogo
    else
      let js = path . '.js'
      if filereadable(pogo)
        exec "e " . js
      else
        echo path . "{.js,.pogo} does not exists"
      endif
    endif
  else
    let module = "node_modules/" . fn . "/index.js"
    if filereadable(module)
      exec "e " . module
    else
      normal gf
    endif
  endif
endfunction
