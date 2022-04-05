" Settings
set ignorecase
set smartcase
set incsearch
set hlsearch
set nocompatible

" Key mapping
" nnoremap <SPACE> <Nop>
let mapleader=" "
set nottimeout
set notimeout

" Only map these in vscode
if exists('g:vscode')

""" General
" Open VSCode quick menu
nnoremap <leader><leader> <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
xnoremap <leader><leader> <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>

" Open VSCode commands quick menu
nnoremap <leader>: <Cmd>call VSCodeNotify('workbench.action.showCommands')<CR>
xnoremap <leader>: <Cmd>call VSCodeNotify('workbench.action.showCommands')<CR>
xnoremap <leader>; <Cmd>call VSCodeNotify('workbench.action.showAllSymbols')<CR>

"Open VSCode symbols quick meVS
nnoremap <leader>; <Cmd>call VSCodeNotify('workbench.action.showAllSymbols')<CR>
xnoremap <leader>; <Cmd>call VSCodeNotify('workbench.action.showAllSymbols')<CR>

" Move line/lines down
nnoremap <M-j> :m .+1<CR>==
xnoremap <M-j> :m '>+1<CR>gv=gv

" Move line/lines up
nnoremap <M-k> :m .-2<CR>==
xnoremap <M-k> :m '<-2<CR>gv=gv


""" Neovim (n)
" Reload configuration
nnoremap <leader>ns :source ~/.config/nvim/init.vim<CR>


""" File (f)
" Save file
nnoremap <leader>fs <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>

" Save file as
nnoremap <leader>fS <Cmd>call VSCodeNotify('workbench.action.files.saveAs')<CR>

" Save all files
nnoremap <leader>fa <Cmd>call VSCodeNotify('workbench.action.files.saveAll')<CR>

" New empty file
nnoremap <leader>fn <Cmd>call VSCodeNotify('workbench.action.files.newUntitledFile')<CR>


""" Window (w)
nmap <leader>wl <C-w>l " Move focus right
nmap <leader>wh <C-w>h " Move focus left
nmap <leader>wj <C-w>j " Move focus down
nmap <leader>wk <C-w>k " Move focus up
nmap <leader>wv <C-w>v " Split vertical
nmap <leader>ws <C-w>s " Split horizontal

" Close window
nmap <leader>wk <Cmd>call VSCodeNotify('workbench.action.closeEditorsInGroup')<CR>


""" Tab (t)
nmap <Leader>tn :tabnew<CR> " New empty tab
nmap <Leader>l :tabnext<CR> " Move to right tab
nmap <Leader>h :tabprev<CR> " Move to left tab
nmap <Leader>to :tabo<CR> " Close all other tabs in window

" Close tab
nmap <leader>tk <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>

" Move tab to right window
nmap <Leader>tL <Cmd>call VSCodeNotify('workbench.action.moveEditorToNextGroup')<CR>

" Move tab to left window
nmap <Leader>tH <Cmd>call VSCodeNotify('workbench.action.moveEditorToPreviousGroup')<CR>


""" View editor panels (v)
" Toggle sidebar
nnoremap <leader>vs <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>

" Show file in file explorer
nnoremap <leader>vf <Cmd>call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<CR>

" Toggle panel
nnoremap <leader>vp <Cmd>call VSCodeNotify('workbench.action.togglePanel')<CR>


""" Navigation / Go to (g)
" Go to next error or warning
nnoremap <leader>ge <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>

" Go to previous error or warning
nnoremap <leader>gE <Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>


""" Select (s)
nnoremap <leader>sa ggvG " Select all
nnoremap <leader>sA mmggVGy'm " Select all and yank

" Copy selection to clipboard
xnoremap <leader>sc <Cmd>call VSCodeNotifyVisual('editor.action.clipboardCopyAction', 0)<CR>

" Paste from clipboard
nnoremap <leader>sp <Cmd>call VSCodeNotifyVisual('editor.action.clipboardPasteAction', 0)<CR>
xnoremap <leader>sp <Cmd>call VSCodeNotifyVisual('editor.action.clipboardPasteAction', 0)<CR>


""" Code (c)
" Show documentation of symbol
nmap <leader>ch <Cmd>call VSCodeNotify('editor.action.showHover')<CR>

" Code action
nmap <leader>ca <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>

" Go to symbol definition
nmap <leader>cd <Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>

" Go to symbol implementation
nmap <leader>ci <Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>

" Go to symbol references
nmap <leader>cr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>

" Go to symbol type definition
nmap <leader>ct <Cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>

" Peek symbol type definition
nmap <leader>cT <Cmd>call VSCodeNotify('editor.action.peekTypeDefinition')<CR>

" Go to next symbol highlight
nmap <leader>cn <Cmd>call VSCodeNotify('editor.action.wordHighlight.next')<CR>

" Go to previous symbol highlight
nmap <leader>cN <Cmd>call VSCodeNotify('editor.action.wordHighlight.prev')<CR>

" Rename symbol
nmap <leader>cR <Cmd>call VSCodeNotify('editor.action.rename')<CR>

" Toggle comment
nnoremap <leader>cc <Cmd>call VSCodeNotify('editor.action.commentLine')<CR>
xnoremap <leader>cc <Cmd>call VSCodeNotifyVisual('editor.action.commentLine', 0)<CR>


endif

""" Plugins
call plug#begin()

Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'

call plug#end()

""" Plugin mappings
map f <Plug>Sneak_f
map F <Plug>Sneak_F
