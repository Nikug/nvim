local M = {}

function M.setup()
  local dashboard = require('alpha.themes.dashboard')
  dashboard.section.buttons.val = {
    dashboard.button("<leader><leader>", "Open file"),
    dashboard.button("<leader>oF", "Open folder"),
    dashboard.button("<leader>fn", "New file"),
    dashboard.button("<leadler>qq", "Quit NVIM"),
  }
  require('alpha').setup(dashboard.config)

end

return M
