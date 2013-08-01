" Vim syntax file
" Language:    cgt
" Maintainer:  Kanat Tangwongsan <ktangwo@us.ibm.com>


if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

"Source the cpp syntax file and load it
ru! syntax/cpp.vim
set filetype=cpp
unlet b:current_syntax

"Put the Perl syntax file in @perlTop
syn include @perlTop syntax/perl.vim

syn region perlBlock matchgroup=perlDelim start=#<%=\?# end=#%># keepend containedin=ALL contains=@perlTop

hi link perlDelim Todo

" vim: set ts=4 sw=4:

