if exists("b:current_syntax")
    finish
endif

syntax keyword pogoKeyword throw return
syntax match pogoVariable /@\i\+/
syntax match pogoParameter /#\i\+/
syntax match pogoOperator /\(\s\|\i\|^\)\@<=[=.:#]\(\s\|\i\|$\)\@=/
syntax match pogoOperator /[[]{}]/
syntax match pogoString /'\([^']*''\)*[^']*'/
syntax match pogoComment /\/\/.*$/

syntax region pogoInterpolation start="@(" end=")" contained contains=ALL

syntax region pogoComment start="/\*" end="\*/"
syntax region pogoString start="\"" end="\"" contains=pogoVariable,pogoInterpolation

highlight link pogoVariable Identifier
highlight link pogoParameter Type
highlight link pogoOperator Operator
highlight link pogoString String
highlight link pogoKeyword Keyword
highlight link pogoComment Comment

let b:current_syntax = "pogo"
