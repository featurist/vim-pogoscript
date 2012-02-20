if exists("b:current_syntax")
    finish
endif

syntax match pogoVariable /@\i\+/
syntax match pogoParameter /#\i\+/
syntax match pogoOperator /\(\s\|\i\|^\)\@<=[=.:#]\(\s\|\i\|$\)\@=/
syntax match pogoOperator /[(){}]/
syntax match pogoString /'([^']*'')*[^']*'/

highlight link pogoVariable Identifier
highlight link pogoParameter Type
highlight link pogoOperator Operator
highlight link pogoString String

let b:current_syntax = "pogo"
