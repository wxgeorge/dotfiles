set number
syntax on
set tabstop=4
set expandtab

" Here's an example of a key binding to execute the current file.
" nnoremap <leader>r :!%:p<Enter>
"
" here's another example:
nnoremap <leader>R :! %:p<Enter>
nnoremap <leader>r :! cat %:p \| preplica \| tee -a ~/vim.out<Enter>
nnoremap <leader>s :! cat %:p \| psandbox \| tee -a ~/vim.out<Enter>
"
" note the need to quote the pipe - I want that to be a unix pipe, not a vim pipe
" (which I'm guessing exists based on the error message I get).
"
"
" See:
" http://stackoverflow.com/questions/15449591/vim-execute-current-file for more
" http://alisnic.github.io/posts/vim-run-hotkey/
" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
"
