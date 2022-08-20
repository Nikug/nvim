local M = {}
api = vim.api

function M.set_keymap(map, input, command, options)
  options = options or { noremap = true }
  api.nvim_set_keymap(map, input, command, options)
end

function M.new_visual_selection(selectionStart, selectionEnd)
  local command = string.format("'normal!%dGV%dG'", selectionStart, selectionEnd)
  api.nvim_eval(command)
end

function M.vscode_move_lines(direction)
  local startLine = vim.fn.getpos("'<")
  local endLine = vim.fn.getpos("'>")
  startLine = startLine[2]
  endLine = endLine[2]
  local topLine = api.nvim_eval('line("w0")')
  local botLine = api.nvim_eval('line("w$")')
  
  -- Check file boundaries
  if startLine == topLine and direction == "Up" then
    M.new_visual_selection(startLine, endLine)
    return
  elseif endLine == botLine and direction == "Down" then
    M.new_visual_selection(startLine, endLine)
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
  
  M.new_visual_selection(newStart, newEnd)
end

return M