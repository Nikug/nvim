local M = {}
api = vim.api

function M.set_keymap(map, input, command, options)
  options = options or { noremap = true }
  api.nvim_set_keymap(map, input, command, options)
end

function M.new_visual_selection(selectionStart, selectionEnd)
    vim.fn.setpos(".", { 0 , selectionStart, 0 })
    api.nvim_command("normal! v")
    vim.fn.setpos(".", { 0 , selectionEnd, 2147483647 })
end

function M.vscode_move_lines(direction)
  local _, startRow = unpack(vim.fn.getpos("'<"))
  local _, endRow = unpack(vim.fn.getpos("'>"))
  local topLine = 1
  local botLine = api.nvim_eval('line("$")')
  
  -- Check file boundaries
  if startRow == topLine and direction == "Up" then
    M.new_visual_selection(startRow, endRow)
    return
  elseif endRow == botLine and direction == "Down" then
    M.new_visual_selection(startRow, endRow)
    return
  end
  -- Call VS Code move lines
  local removeVsCodeSelectionAfterCommand = 1
  local vsCodeCommand = string.format("editor.action.moveLines%sAction", direction)
  local vimCommand = string.format("call VSCodeCallRange('%s',%s,%s,%s)", vsCodeCommand, startRow, endRow, removeVsCodeSelectionAfterCommand)
  api.nvim_exec(vimCommand, false)
  
  -- Calculate new visual selection and update it
  local newStart, newEnd
  if direction == "Up" then
    newStart = startRow - 1
    newEnd = endRow - 1
  else
    newStart = startRow + 1
    newEnd = endRow + 1
  end
  
  M.new_visual_selection(newStart, newEnd)
end

return M