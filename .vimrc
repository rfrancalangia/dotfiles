syntax on
set number
set mouse=a
set tabstop=4
set cindent

"Create .c and .h comment headers
"begin ---
autocmd bufnewfile *.{h,c,js} so /Users/robertfrancalangia/c_header.txt
function! s:insert_header()
   let filename = expand("%:t")
  execute "normal! o"
endfunction
autocmd BufNewFile *.{h,c,js} call <SID>insert_header()
autocmd bufnewfile *.{h,c,js} exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.{h,c,js} exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%m-%d-%Y")
autocmd Bufwritepre,filewritepre *.{h,c,js} execute "normal ma"
autocmd Bufwritepre,filewritepre *.{h,c,js} exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.{h,c,js} execute "normal `a"
" --- end

"Create Makefile comment headers
"begin ---
autocmd bufnewfile {Makefile,*.py} so /Users/robertfrancalangia/makefile_header.txt
function! s:insert_header()
   let filename = expand("%:t")
  execute "normal! o"
endfunction
autocmd BufNewFile {Makefile,*.py} call <SID>insert_header()
autocmd bufnewfile {Makefile,*.py} exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile {Makefile,*.py} exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%m-%d-%Y")
autocmd Bufwritepre,filewritepre {Makefile,*.py} execute "normal ma"
autocmd Bufwritepre,filewritepre {Makefile,*.py} exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost {Makefile,*.py} execute "normal `a"
" --- end
