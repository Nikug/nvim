api = vim.api

function set_keymap(map, input, command, options)
  options = options or { noremap = true, silent = true }
  api.nvim_set_keymap(map, input, command, options)
end

function NewVisualSelection(selectionStart, selectionEnd)
  local command = string.format("'normal!%dGV%dG'", selectionStart, selectionEnd)
  api.nvim_eval(command)
end

function VSCodeCallMoveLines(direction)
  local startLine = vim.fn.getpos("'<")
  local endLine = vim.fn.getpos("'>")
  print(startLine, endLine)
  local topLine = api.nvim_eval('line("w0")')
  local botLine = api.nvim_eval('line("w$")')
  
  -- Check file boundaries
  if startLine == topLine and direction == "Up" then
    NewVisualSelection(startLine, endLine)
    return
  elseif endLine == botLine and direction == "Down" then
    NewVisualSelection(startLine, endLine)
    return
  end
  
  -- Call VS Code move lines
  local removeVsCodeSelectionAfterCommand = 1
  local vsCodeCommand = string.format("editor.action.moveLines%sAction", direction)
  local vimCommand = string.format("call VSCodeCallRange('%s',%d,%d,%d)", vsCodeCommand, startLine, endLine, removeVsCodeSelectionAfterCommand)
  print(vimCommand)
  api.nvim_exec(vimCommand, false)
  
  -- Calculate new visual selection and update it
  local newStart, newEnd
  if direction == "Up" then
    newStart = startLine - 1
    newEnd = endLine - 1
  else
    newStart = startLine + 1
    newEnd = endLine + 1
  end
  
  NewVisualSelection(newStart, newEnd)
end

---- General
-- Open VSCode quick menu
set_keymap('n', '<leader><leader>', '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>')
set_keymap('x', '<leader><leader>', '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>')

-- Open VSCode commands quick menu
set_keymap('n', '<leader>:', '<Cmd>call VSCodeNotify("workbench.action.showCommands")<CR>')
set_keymap('x', '<leader>:', '<Cmd>call VSCodeNotify("workbench.action.showCommands")<CR>')

-- Open VSCode symbols quick menu
set_keymap('n', '<leader>;', '<Cmd>call VSCodeNotify("workbench.action.showAllSymbols")<CR>')
set_keymap('x', '<leader>;', '<Cmd>call VSCodeNotify("workbench.action.showAllSymbols")<CR>')

-- Move line/lines down
set_keymap('n', '<M-j>', '<Cmd>call VSCodeCall("editor.action.moveLinesDownAction")<CR>')
set_keymap('v', '<M-j>', [[<Cmd>lua VSCodeCallMoveLines("Down")<CR>]])

-- Move line/lines up
set_keymap('n', '<M-k>', '<Cmd>call VSCodeCall("editor.action.moveLinesUpAction")<CR>')
set_keymap('v', '<M-k>', [[<Cmd>lua VSCodeCallMoveLines("Up")<CR>]])


---- Neovim (n)
-- Reload configuration
set_keymap('n', '<leader>ns', ':source <CR>')


---- File (f)
-- Save file
set_keymap('n', '<leader>fs', '<Cmd>call VSCodeCall("workbench.action.files.save")<CR>')

-- Save file as
set_keymap('n', '<leader>fS', '<Cmd>call VSCodeCall("workbench.action.files.saveAs")<CR>')

-- Save all files
set_keymap('n', '<leader>fa', '<Cmd>call VSCodeCall("workbench.action.files.saveAll")<CR>')

-- Save file without formatting
set_keymap('n', '<leader>fw', '<Cmd>call VSCodeCall("workbench.action.files.saveWithoutFormatting")<CR>')

-- Format file
set_keymap('n', '<leader>ff', '<Cmd>call VSCodeCall("editor.action.formatDocument")<CR>')

-- New empty file
set_keymap('n', '<leader>fn', '<Cmd>call VSCodeCall("workbench.action.files.newUntitledFile")<CR>')


---- Window (w)
set_keymap('n', '<leader>wl', '<C-w>l') -- Move focus right
set_keymap('n', '<leader>wh', '<C-w>h') -- Move focus left
set_keymap('n', '<leader>wj', '<C-w>j') -- Move focus down
set_keymap('n', '<leader>wk', '<C-w>k') -- Move focus up
set_keymap('n', '<leader>wv', '<C-w>v') -- Split vertical
set_keymap('n', '<leader>ws', '<C-w>s') -- Split horizontal

-- Close window
set_keymap('n', '<leader>wk', '<Cmd>call VSCodeNotify("workbench.action.closeEditorsInGroup")<CR>')


---- Tab (t)
set_keymap('n', '<Leader>tn', ':tabnew<CR>') -- New empty tab
set_keymap('n', '<Leader>l', ':tabnext<CR>') -- Move to right tab
set_keymap('n', '<Leader>h', ':tabprev<CR>') -- Move to left tab
set_keymap('n', '<Leader>to', ':tabo<CR>') -- Close all other tabs in window

-- Close tab
set_keymap('n', '<leader>tk', '<Cmd>call VSCodeNotify("workbench.action.closeActiveEditor")<CR>')

-- Move tab to right window
set_keymap('n', '<Leader>tL', '<Cmd>call VSCodeNotify("workbench.action.moveEditorToNextGroup")<CR>')

-- Move tab to left window
set_keymap('n', '<Leader>tH', '<Cmd>call VSCodeNotify("workbench.action.moveEditorToPreviousGroup")<CR>')


---- View editor panels (v)
-- Toggle sidebar
set_keymap('n', '<leader>vs', '<Cmd>call VSCodeNotify("workbench.action.toggleSidebarVisibility")<CR>')

-- Show file in file explorer
set_keymap('n', '<leader>vf', '<Cmd>call VSCodeNotify("workbench.files.action.showActiveFileInExplorer")<CR>')

-- Toggle panel
set_keymap('n', '<leader>vp', '<Cmd>call VSCodeNotify("workbench.action.togglePanel")<CR>')


---- Navigation / Go to (g)
-- Go to next error or warning
set_keymap('n', '<leader>ge', '<Cmd>call VSCodeNotify("editor.action.marker.next")<CR>')

-- Go to previous error or warning
set_keymap('n', '<leader>gE', '<Cmd>call VSCodeNotify("editor.action.marker.prev")<CR>')


---- Select (s)
set_keymap('n', '<leader>sa', 'gg^VG$') -- Select all
set_keymap('n', '<leader>sA', 'mmgg^VG$y"m') -- Select all and yank

-- Copy selection to clipboard
set_keymap('x', '<leader>sc', '<Cmd>call VSCodeCallVisual("editor.action.clipboardCopyAction", 0)<CR>')

-- Paste from clipboard
set_keymap('n', '<leader>sp', '<Cmd>call VSCodeCall("editor.action.clipboardPasteAction")<CR>')
set_keymap('x', '<leader>sp', '<Cmd>call VSCodeCall("editor.action.clipboardPasteAction")<CR>')


---- Code (c)
-- Show documentation of symbol
set_keymap('n', '<leader>ch', '<Cmd>call VSCodeNotify("editor.action.showHover")<CR>')

-- Code action
set_keymap('n', '<leader>ca', '<Cmd>call VSCodeNotify("editor.action.quickFix")<CR>')

-- Go to symbol definition
set_keymap('n', '<leader>cd', '<Cmd>call VSCodeNotify("editor.action.revealDefinition")<CR>')

-- Go to symbol implementation
set_keymap('n', '<leader>ci', '<Cmd>call VSCodeNotify("editor.action.goToImplementation")<CR>')

-- Go to symbol references
set_keymap('n', '<leader>cr', '<Cmd>call VSCodeNotify("editor.action.goToReferences")<CR>')

-- Go to symbol type definition
set_keymap('n', '<leader>ct', '<Cmd>call VSCodeNotify("editor.action.goToTypeDefinition")<CR>')

-- Peek symbol type definition
set_keymap('n', '<leader>cT', '<Cmd>call VSCodeNotify("editor.action.peekTypeDefinition")<CR>')

-- Go to next symbol highlight
set_keymap('n', '<leader>cn', '<Cmd>call VSCodeNotify("editor.action.wordHighlight.next")<CR>')

-- Go to previous symbol highlight
set_keymap('n', '<leader>cN', '<Cmd>call VSCodeNotify("editor.action.wordHighlight.prev")<CR>')

-- Rename symbol
set_keymap('n', '<leader>cR', '<Cmd>call VSCodeCall("editor.action.rename")<CR>')

-- Toggle comment
set_keymap('n', '<leader>cc', '<Cmd>call VSCodeCall("editor.action.commentLine")<CR>')
set_keymap('x', '<leader>cc', '<Cmd>call VSCodeCallVisual("editor.action.commentLine", 0)<CR>')