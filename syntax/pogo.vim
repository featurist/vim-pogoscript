if exists("b:current_syntax")
    finish
endif

syntax match pogoAsync /!/
syntax match pogoFuture /?/
syntax match pogoTab /\t/
syntax match pogoNumber "\v[a-zA-Z]@<![0-9]+(.[0-9]+)?"

syntax match pogoOperator "==\|!=\|<-\|=>\|<=\|>=\|<\|>"
syntax match pogoOperator "\v[+-/*]"
syntax match pogoOperator /=\|:=/
syntax match pogoOperator "\.\|:\|,\|\.\.\."
syntax match pogoOperator /@[a-zA-Z_$][a-zA-Z_$0-9]*/

syntax match pogoEscape /\\./ contained
syntax match pogoSingleQuoteEscape /''/ contained
syntax match pogoBracket /@(\|@{\|#(\|[\[\](){}]/
syntax match pogoComment /\/\/.*$/
syntax match pogoKeyword /\([a-zA-Z$_]\s\+\)\@<!\<\(return\|self\|throw\|try\|catch\|finally\|if\|else\s\+if\|else\|while\|for\|new\|true\|false\|nil\|debugger\|continuation\)\>\(\s\+[a-zA-Z$_]\)\@!/

syntax region pogoInterpolation start="#(" end=")" contained keepend extend contains=TOP
syntax region pogoParens start="(" end=")" transparent 

syntax region pogoComment start="/\*" end="\*/"
syntax region pogoString matchgroup=pogoString start="'" end="'" contains=pogoSingleQuoteEscape
syntax region pogoString start="\"" end="\"" contains=pogoInterpolation,pogoEscape
syntax region pogoString start="r/" end="/[gim]*" contains=pogoEscape

highlight link pogoTab ErrorMsg
highlight link pogoNumber Number
highlight link pogoOperator Operator
highlight link pogoBracket Type
highlight link pogoAsync Delimiter
highlight link pogoFuture Delimiter
highlight link pogoString String
highlight link pogoEscape Special
highlight link pogoSingleQuoteEscape Special
highlight link pogoKeyword Function
highlight link pogoComment Comment

let b:current_syntax = "pogo"
