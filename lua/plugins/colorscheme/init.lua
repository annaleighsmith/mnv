return {

  {
    "folke/styler.nvim",
    event = "VeryLazy",
    config = function()
      require("styler").setup {
        themes = {
          markdown = { colorscheme = "onenord" },
          help = { colorscheme = "onenord" },
        },
      }
    end,
  },
  {
    "rmehri01/onenord.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = "dark", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
      borders = true, -- Split window borders
      fade_nc = false, -- Fade non-current windows, making them more distinguishable
      -- Style that is applied to various groups: see `highlight-args` for options
      styles = {
        comments = "NONE",
        strings = "NONE",
        keywords = "NONE",
        functions = "NONE",
        variables = "NONE",
        diagnostics = "underline",
      },
      disable = {
        background = false, -- Disable setting the background color
        cursorline = true, -- Disable the cursorline
        eob_lines = true, -- Hide the end-of-buffer lines
      },
      -- Inverse highlight for different groups
      inverse = {
        match_paren = false,
      },
      custom_colors = {
        bg = "#22272f", -- default is #2E3440
      }, -- Overwrite default colors
    },
    config = function(_, opts)
      local onenord = require "onenord"
      local colors = require("onenord.colors").load()
      opts.custom_highlights = {
        AlphaHeader = { fg = colors.blue },
        AlphaButtons = { fg = colors.green },
        AlphaShortcut = { fg = colors.yellow },
      } -- O
      onenord.setup(opts)
      onenord.load()
    end,
  },
}
