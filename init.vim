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
  
""" Functions
function! NewVisualSelection(start, end)
  let newVisualSelection = "normal!" . a:start . "GV" . a:end . "G"
  execute newVisualSelection
endfunction

function! VSCodeCallMoveLines(direction)
  let startLine = getpos("'<")[1]
  let endLine = getpos("'>")[1]
  let topLine = line("w0")
  let botLine = line("w$")
  
  " Check file boundaries
  if startLine == topLine && a:direction == "Up"
    call NewVisualSelection(startLine, endLine)
    return
  elseif endLine == botLine && a:direction == "Down" 
    call NewVisualSelection(startLine, endLine)
    return
  endif
  
  " Call VS Code move liens
  let removeVsCodeSelectionAfterCommand = 1
  let vsCodeCommand = 'editor.action.moveLines' . a:direction . 'Action'
  call VSCodeCallRange(vsCodeCommand, startLine, endLine, removeVsCodeSelectionAfterCommand)
  
  " Calculate new visual selection and update it
  if a:direction == "Up"
    let newStart = startLine - 1
    let newEnd = endLine - 1
  else
    let newStart = startLine + 1
    let newEnd = endLine + 1
  endif
  
  call NewVisualSelection(newStart, newEnd)
endfunction

""" General h h
" Open VSCode quick menu
nnoremap <leader><leader> <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
xnoremap <leader><leader> <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>

" Open VSCode commands quick menu
nnoremap <leader>: <Cmd>call VSCodeNotify('workbench.action.showCommands')<CR>
xnoremap <leader>: <Cmd>call VSCodeNotify('workbench.action.showCommands')<CR>

"Open VSCode symbols quick menu
nnoremap <leader>; <Cmd>call VSCodeNotify('workbench.action.showAllSymbols')<CR>
xnoremap <leader>; <Cmd>call VSCodeNotify('workbench.action.showAllSymbols')<CR>

" Move line/lines down
" nnoremap <M-j> :m .+1<CR>==
" xnoremap <M-j> :m '>+1<CR>gv=gv
nmap <M-j> <Cmd>call VSCodeCall('editor.action.moveLinesDownAction')<CR>
vmap <M-j> <Esc>:call VSCodeCallMoveLines('Down')<CR>

" Move line/lines up
" nnoremap <M-k> :m .-2<CR>==
" xnoremap <M-k> :m '<-2<CR>gv=gv
nmap <M-k> <Cmd>call VSCodeCall('editor.action.moveLinesUpAction')<CR>
vmap <M-k> <Esc>:call VSCodeCallMoveLines('Up')<CR>


""" Neovim (n)
" Reload configuration
nnoremap <leader>ns :source <CR>


""" File (f)
" Save file
nnoremap <leader>fs <Cmd>call VSCodeCall('workbench.action.files.save')<CR>

" Save file as
nnoremap <leader>fS <Cmd>call VSCodeCall('workbench.action.files.saveAs')<CR>

" Save all files
nnoremap <leader>fa <Cmd>call VSCodeCall('workbench.action.files.saveAll')<CR>

" Save file without formatting
nnoremap <leader>fw <Cmd>call VSCodeCall('workbench.action.files.saveWithoutFormatting')<CR>

" Format file
nnoremap <leader>ff <Cmd>call VSCodeCall('editor.action.formatDocument')<CR>

" New empty file
nnoremap <leader>fn <Cmd>call VSCodeCall('workbench.action.files.newUntitledFile')<CR>


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
xnoremap <leader>sc <Cmd>call VSCodeCallVisual('editor.action.clipboardCopyAction', 0)<CR>

" Paste from clipboard
nnoremap <leader>sp <Cmd>call VSCodeCallVisual('editor.action.clipboardPasteAction', 0)<CR>
xnoremap <leader>sp <Cmd>call VSCodeCallVisual('editor.action.clipboardPasteAction', 0)<CR>


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
nmap <leader>cR <Cmd>call VSCodeCall('editor.action.rename')<CR>

" Toggle comment
nnoremap <leader>cc <Cmd>call VSCodeCall('editor.action.commentLine')<CR>
xnoremap <leader>cc <Cmd>call VSCodeCallVisual('editor.action.commentLine', 0)<CR>


endif

""" Plugins
call plug#begin()

Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'

call plug#end()

""" Plugin mappings
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
