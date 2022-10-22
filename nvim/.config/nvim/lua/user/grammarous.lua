-- from here: https://github.com/jdhao/nvim-config/commit/c146a50967f6dae2e411fb00b342545e2ece3700
vim.cmd [[
let g:grammarous#languagetool_cmd = 'languagetool'
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0,
            \ }
let g:grammarous#disabled_rules = {
    \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES', 'ARROWS', 'SENTENCE_WHITESPACE',
    \        'WORD_CONTAINS_UNDERSCORE', 'COMMA_PARENTHESIS_WHITESPACE',
    \        'EN_UNPAIRED_BRACKETS', 'UPPERCASE_SENTENCE_START',
    \        'ENGLISH_WORD_REPEAT_BEGINNING_RULE', 'DASH_RULE', 'PLUS_MINUS',
    \        'PUNCTUATION_PARAGRAPH_END', 'MULTIPLICATION_SIGN', 'PRP_CHECKOUT',
    \        'CAN_CHECKOUT', 'SOME_OF_THE', 'DOUBLE_PUNCTUATION', 'HELL',
    \        'CURRENCY', 'POSSESSIVE_APOSTROPHE', 'ENGLISH_WORD_REPEAT_RULE',
    \        'NON_STANDARD_WORD'],
    \ }
]]

