local api = vim.api

local set_keymap = require("utils").set_keymap

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
set_keymap('v', '<M-j>', [[<Esc><Cmd>lua require("utils").vscode_move_lines("Down")<CR>]])

-- Move line/lines up
set_keymap('n', '<M-k>', '<Cmd>call VSCodeCall("editor.action.moveLinesUpAction")<CR>')
set_keymap('v', '<M-k>', [[<Esc><Cmd>lua require("utils").vscode_move_lines("Up")<CR>]])

-- Find in all files
set_keymap('n', '<leader>/', '<Cmd>call VSCodeNotify("search.action.openEditor")<CR>')
set_keymap('v', '<leader>/', '<Cmd>call VSCodeNotify("search.action.openEditor")<CR>')

-- Yank ring cycles
set_keymap('n', '<C-p>', '<Plug>yankstack_substitute_older_paste', { noremap = false })
set_keymap('n', '<C-P>', '<Plug>yankstack_substitute_newer_paste', { noremap = false })


---- Neovim (n)
-- Reload configuration
set_keymap('n', '<leader>ns', '<Cmd>source<CR>')
set_keymap('n', '<leader>nl', '<Cmd>luafile<CR>')


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
set_keymap('n', '<leader>wl', '<Cmd>call VSCodeCall("workbench.action.focusRightGroup")<CR>') -- Move focus right
set_keymap('n', '<leader>wh', '<Cmd>call VSCodeCall("workbench.action.focusLeftGroup")<CR>') -- Move focus left
set_keymap('n', '<leader>wJ', '<Cmd>call VSCodeCall("workbench.action.focusBelowGroup")<CR>') -- Move focus down
set_keymap('n', '<leader>wK', '<Cmd>call VSCodeCall("workbench.action.focusAboveGroup")<CR>') -- Move focus up
set_keymap('n', '<leader>wv', '<Cmd>call VSCodeCall("workbench.action.splitEditorRight")<CR>') -- Split vertical
set_keymap('n', '<leader>ws', '<Cmd>call VSCodeCall("workbench.action.splitEditorDown")<CR>') -- Split horizontal
set_keymap('n', '<leader>wc', '<Cmd>call VSCodeCall("workbench.action.joinTwoGroups")<CR>') -- Join next group
set_keymap('n', '<leader>wC', '<Cmd>call VSCodeCall("workbench.action.joinAllGroups")<CR>') -- Joint all groups

-- Close window
set_keymap('n', '<leader>wk', '<Cmd>call VSCodeNotify("workbench.action.closeEditorsInGroup")<CR>', { noremap = false })


---- Tab (t)
-- New empty tab
set_keymap('n', '<Leader>tn', '<Cmd>call VSCodeCall("workbench.action.files.newUntitledFile")<CR>')

-- Move to right tab
set_keymap('n', '<Leader>l', '<Cmd>call VSCodeCall("workbench.action.nextEditor")<CR>', { noremap = false })

-- Move to left tab
set_keymap('n', '<Leader>h', '<Cmd>call VSCodeCall("workbench.action.previousEditor")<CR>', { noremap = false })

-- Close all other tabs in window
set_keymap('n', '<Leader>to', '<Cmd>call VSCodeCall("workbench.action.closeOtherEditors")<CR>')

-- Close tab
set_keymap('n', '<leader>tk', '<Cmd>call VSCodeCall("workbench.action.closeActiveEditor")<CR>')

-- Move tab to right window
set_keymap('n', '<Leader>tL', '<Cmd>call VSCodeCall("workbench.action.moveEditorToRightGroup")<CR>')

-- Move tab to left window
set_keymap('n', '<Leader>tH', '<Cmd>call VSCodeCall("workbench.action.moveEditorToLeftGroup")<CR>')
--
-- Move tab to below window
set_keymap('n', '<Leader>tJ', '<Cmd>call VSCodeCall("workbench.action.moveEditorToBelowGroup")<CR>')

-- Move tab to above window
set_keymap('n', '<Leader>tK', '<Cmd>call VSCodeCall("workbench.action.moveEditorToAboveGroup")<CR>')


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
set_keymap('n', '<leader>sA', "mmgg^VG$y'm") -- Select all and yank

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
set_keymap('n', '<leader>cd', '<Cmd>call VSCodeCall("editor.action.revealDefinition")<CR>')

-- Go to symbol implementation
set_keymap('n', '<leader>ci', '<Cmd>call VSCodeCall("editor.action.goToImplementation")<CR>')

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
