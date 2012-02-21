if exists("b:current_syntax")
    finish
endif

syntax match pogoVariable /@\i\+/
syntax match pogoParameter /#\i\+/
syntax match pogoOperator /\(\s\|\i\|^\)\@<=[=.:#]\(\s\|\i\|$\)\@=/
syntax match pogoOperator /[(){}]/
syntax match pogoString /'\([^']*''\)*[^']*'/
syntax match pogoKeyword /\<throw\>\|\<return\>/

highlight link pogoVariable Identifier
highlight link pogoParameter Type
highlight link pogoOperator Operator
highlight link pogoString String
highlight link pogoKeyword Keyword

let b:current_syntax = "pogo"
