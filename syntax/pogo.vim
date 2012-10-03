if exists("b:current_syntax")
    finish
endif

syntax match pogoNumber /[0-9]\+\(\.[0-9]\+\)\?/
syntax match pogoOperator /\(\s\|\i\|^\)\@<=[=.:#]\(\s\|\i\|$\)\@=/
syntax match pogoBracket /@(\|@{\|#(\|[\[\](){}]/
syntax match pogoComment /\/\/.*$/
syntax match pogoKeyword /\([a-zA-Z$_]\s\+\)\@<!\<\(return\|self\|throw\|try\|catch\|finally\|if\|else\|while\|for\|new\|true\|false\|debugger\)\>\(\s\+[a-zA-Z$_]\)\@!/

syntax region pogoInterpolation start="#(" end=")" contained contains=TOP

syntax region pogoComment start="/\*" end="\*/"
syntax region pogoString start="\"" end="\"" contains=pogoInterpolation
syntax region pogoString start="'" end="'"

highlight link pogoNumber Number
highlight link pogoOperator Operator
highlight link pogoBracket Macro
highlight link pogoString String
highlight link pogoKeyword Function
highlight link pogoComment Comment

let b:current_syntax = "pogo"
