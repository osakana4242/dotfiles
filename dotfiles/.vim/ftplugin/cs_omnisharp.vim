"
"let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
"let g:SuperTabClosePreviewOnPopupClose = 1
"
""Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
"setlocal omnifunc=OmniSharp#Complete
"
"" Synchronous build (blocks Vim)
""nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
"" Builds can also run asynchronously with vim-dispatch installed
"nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
"" automatic syntax check on events (TextChanged requires Vim 7.4)
"" autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
"
"" Automatically add new cs files to the nearest project on save
"autocmd BufWritePost *.cs call OmniSharp#AddToProject()
"
""show type information automatically when the cursor stops moving
"autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
"
""The following commands are contextual, based on the current cursor position.
"
"nnoremap gd :OmniSharpGotoDefinition<cr>
"nnoremap <leader>fi :OmniSharpFindImplementations<cr>
"nnoremap <leader>ft :OmniSharpFindType<cr>
"nnoremap <leader>fs :OmniSharpFindSymbol<cr>
"nnoremap <leader>fu :OmniSharpFindUsages<cr>
""finds members in the current buffer
"nnoremap <leader>fm :OmniSharpFindMembers<cr>
"" cursor can be anywhere on the line containing an issue 
"nnoremap <leader>x  :OmniSharpFixIssue<cr>  
"nnoremap <leader>fx :OmniSharpFixUsings<cr>
"nnoremap <leader>tt :OmniSharpTypeLookup<cr>
"nnoremap <leader>dc :OmniSharpDocumentation<cr>
""navigate up by method/property/field.
"nnoremap <C-K> :OmniSharpNavigateUp<cr>
""navigate down by method/property/field.
"nnoremap <C-J> :OmniSharpNavigateDown<cr>
"
"
"" this setting controls how long to wait (in ms) before fetching type / symbol information.
"set updatetime=1000
"" Remove 'Press Enter to continue' message when type information is longer than one line.
"set cmdheight=2
"
"" Contextual code actions (requires CtrlP)
"nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
"" Run code actions with text selected in visual mode to extract method
"vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>
"
"" rename with dialog
"nnoremap <leader>nm :OmniSharpRename<cr>
"nnoremap <F2> :OmniSharpRename<cr>      
"" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
"command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
"
"" Force OmniSharp to reload the solution. Useful when switching branches etc.
"nnoremap <leader>rl :OmniSharpReloadSolution<cr>
"nnoremap <leader>cf :OmniSharpCodeFormat<cr>
"" Load the current .cs file to the nearest project
"nnoremap <leader>tp :OmniSharpAddToProject<cr>
"
"" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
"nnoremap <leader>ss :OmniSharpStartServer<cr>
"nnoremap <leader>sp :OmniSharpStopServer<cr>
"
"" Add syntax highlighting for types and interfaces
"nnoremap <leader>th :OmniSharpHighlightTypes<cr>
"
