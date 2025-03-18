return {
  "folke/trouble.nvim",
  config = function()
    local trouble = require('trouble')

    trouble.setup{
      modes = {
        mydiags = {
          mode = "diagnostics", -- inherit from diagnostics mode
          filter = {
            any = {
              buf = 0, -- current buffer
              {
                severity = vim.diagnostic.severity.ERROR, -- errors only
                -- limit to files in the current project
                --function(item)
                --  return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
                --end,
              },
            },
          },
        }
      },
      preview_float = {
        mode = "diagnostics",
        preview = {
          type = "float",
          relative = "editor",
          border = "rounded",
          title = "Preview",
          title_pos = "center",
          position = { 0, -2 },
          size = { width = 0.3, height = 0.3 },
          zindex = 200,
        },
      },
    }
  end,
}
