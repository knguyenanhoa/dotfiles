" Vim syntax file
" Language: logentry
" Maintainer: Klinkesorn Nguyen An Hoa
" Latest Revision: 02092018


if exists("b:current_syntax")
        finish
endif

" Meta
syn keyword entKeyword date loc NOTE LEC
highlight link entKeyword Keyword

" Paper region
syntax region poolRegion start=/\v\PAPER/ skip=/\v\\./ end=/\v\:/
highlight link poolRegion PreProc

" Drop region
syntax region poolRegion start=/\v\:pool/ skip=/\v\\./ end=/\v\:/
highlight link poolRegion PreProc

" Auto region
syntax region autoRegion start=/\v\:auto/ skip=/\v\\./ end=/\v\:/
highlight link autoRegion Comment

" Pass region
syntax region passRegion start=/\v\:pass/ skip=/\v\\./ end=/\v\:/
highlight link passRegion Special

" Do region
syntax region doRegion start=/\v\:do/ skip=/\v\\./ end=/\v\:/
highlight link doRegion Constant

" Test region
syntax region testRegion start=/\v\:test/ skip=/\v\\./ end=/\v\:/
highlight link testRegion Type

let b:current_syntax="ent"
