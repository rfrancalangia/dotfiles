syntax on
set number
set mouse=a

"Create .c and .h comment headers
"begin ---
autocmd bufnewfile *.{h,c} so /Users/robertfrancalangia/c_header.txt
function! s:insert_header()
   let filename = expand("%:t")
  execute "normal! o"
endfunction
autocmd BufNewFile *.{h,c} call <SID>insert_header()
autocmd bufnewfile *.{h,c} exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.{h,c} exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%m-%d-%Y")
autocmd Bufwritepre,filewritepre *.{h,c} execute "normal ma"
autocmd Bufwritepre,filewritepre *.{h,c} exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.{h,c} execute "normal `a"
" --- end

"Create Makefile comment headers
"begin ---
autocmd bufnewfile Makefile so /Users/robertfrancalangia/makefile_header.txt
function! s:insert_header()
   let filename = expand("%:t")
  execute "normal! o"
endfunction
autocmd BufNewFile Makefile call <SID>insert_header()
autocmd bufnewfile Makefile exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile Makefile exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%m-%d-%Y")
autocmd Bufwritepre,filewritepre Makefile execute "normal ma"
autocmd Bufwritepre,filewritepre Makefile exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost Makefile execute "normal `a"
" --- end
