if exists("b:current_syntax")
    finish
endif

syntax match pogoAsync /[!^]/
syntax match pogoFuture /?/
syntax match pogoTab /\t/
syntax match pogoIdentifier "\v[$_a-zA-Z][$_a-zA-Z0-9]*"
syntax match pogoNumber "\v[0-9]+(.[0-9]+)?"

syntax match pogoOperator "==\|!=\|<-\|=>\|<=\|>=\|<\|>"
syntax match pogoOperator "\v[+-/*]"
syntax match pogoOperator /=\|:=/
syntax match pogoOperator "\.\|:\|,\|\.\.\."
syntax match pogoOperator /@[a-zA-Z_$][a-zA-Z_$0-9]*/

syntax match pogoEscape /\\./ contained
syntax match pogoSingleQuoteEscape /''/ contained
syntax match pogoStrayBracket /[\])}]/
syntax match pogoComment /\/\/.*$/
syntax match pogoKeyword /\([a-zA-Z$_]\s\+\)\@<!\<\(return\|require\|module\|exports\|self\|throw\|try\|catch\|finally\|if\|else\s\+if\|else\|while\|for\|new\|true\|false\|nil\|debugger\|continuation\)\>\(\s\+[a-zA-Z$_]\)\@!/
syntax match pogoRegexElement /[+|*.?()^$]/ contained

syntax region pogoParens matchgroup=pogoBracket start="(" end=")" transparent contains=TOP
syntax region pogoParams matchgroup=pogoBracket start="@(" end=")" transparent contains=TOP
syntax region pogoParams matchgroup=pogoBracket start="{" end="}" transparent contains=TOP
syntax region pogoParams matchgroup=pogoBracket start="@{" end="}" transparent contains=TOP
syntax region pogoParams matchgroup=pogoBracket start="\[" end="\]" transparent contains=TOP
syntax region pogoInterpolation matchgroup=pogoBracket start="#(" end=")" contained contains=TOP

syntax region pogoComment start="/\*" end="\*/"
syntax region pogoString matchgroup=pogoString start="'" end="'" contains=pogoSingleQuoteEscape
syntax region pogoString start="\"" end="\"" contains=pogoInterpolation,pogoEscape
syntax region pogoString start="r/" end="/[gim]*" contains=pogoRegexElement,pogoEscape

highlight link pogoTab Error
highlight link pogoNumber Number
highlight link pogoOperator Operator
highlight link pogoBracket Type
highlight link pogoStrayBracket Error
highlight link pogoAsync Delimiter
highlight link pogoFuture Delimiter
highlight link pogoString String
highlight link pogoEscape Special
highlight link pogoRegexElement Special
highlight link pogoSingleQuoteEscape Special
highlight link pogoKeyword Function
highlight link pogoComment Comment

let b:current_syntax = "pogo"
