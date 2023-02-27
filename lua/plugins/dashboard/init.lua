-- return {
--   "goolord/alpha-nvim",
--   event = "VimEnter",
--   config = function()
--     local dashboard = require "alpha.themes.dashboard"
--     dashboard.section.header.val = require("plugins.dashboard.logo")["random"]
--     dashboard.section.buttons.val = {
--       dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
--       dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
--       dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
--       dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
--       dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
--       dashboard.button("s", "勒" .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
--       dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
--       dashboard.button("q", " " .. " Quit", ":qa<CR>"),
--     }
--     for _, button in ipairs(dashboard.section.buttons.val) do
--       button.opts.hl = "AlphaButtons"
--       button.opts.hl_shortcut = "AlphaShortcut"
--     end
--     dashboard.section.footer.opts.hl = "Constant"
--     dashboard.section.header.opts.hl = "AlphaHeader"
--     dashboard.section.buttons.opts.hl = "AlphaButtons"
--     dashboard.opts.layout[1].val = 0
--
--     -- close Lazy and re-open when the dashboard is ready
--     if vim.o.filetype == "lazy" then
--       vim.cmd.close()
--       vim.api.nvim_create_autocmd("User", {
--         pattern = "AlphaReady",
--         callback = function()
--           require("lazy").show()
--         end,
--       })
--     end
--
--     require("alpha").setup(dashboard.opts)
--
--     vim.api.nvim_create_autocmd("User", {
--       pattern = "LazyVimStarted",
--       callback = function()
--         local stats = require("lazy").stats()
--         local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
--
--         -- local now = os.date "%d-%m-%Y %H:%M:%S"
--         local version = "   v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
--         local fortune = require "alpha.fortune"
--         local quote = table.concat(fortune(), "\n")
--         local plugins = "⚡Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
--         local footer = "\t" .. version .. "\t" .. plugins .. "\n" .. quote
--         dashboard.section.footer.val = footer
--         pcall(vim.cmd.AlphaRedraw)
--       end,
--     })
--   end,
-- }
return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require "alpha.themes.dashboard"
      local logo = [[
      ███╗   ██╗ ███████╗  ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗        Z
      ████╗  ██║ ██╔════╝ ██╔═══██╗ ██║   ██║ ██║ ████╗ ████║     Z
      ██╔██╗ ██║ █████╗   ██║   ██║ ██║   ██║ ██║ ██╔████╔██║   Z
      ██║╚██╗██║ ██╔══╝   ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ z
      ██║ ╚████║ ███████╗ ╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
      ╚═╝  ╚═══╝ ╚══════╝  ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝
     ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("p", " " .. "Open project", "<cmd>Telescope project display_type=full<cr>"),
        dashboard.button("e", " " .. "New file", "<cmd>ene <BAR> startinsert<cr>"),
        dashboard.button("f", " " .. "Find file", "<cmd>cd /home/anna/projects | Telescope find_files<cr>"),
        dashboard.button("r", " " .. "Recent files", "<CMD>Telescope oldfiles<cr>"),
        dashboard.button("s", "勒" .. "Restore Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button("g", " " .. "Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. "Config", ":e $MYVIMRC | :cd %:p:h | Telescope file_browser<cr>"),
        dashboard.button("l", "鈴" .. "Lazy", "<cmd>Lazy<cr>"),
        dashboard.button("m", " " .. "Mason", "<cmd>Mason<cr>"),
        dashboard.button("q", " " .. "Quit", "<cmd>qa<cr>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
            vim.opt.showtabline = 0
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          --         local fortune = require "alpha.fortune"
          --         local quote = table.concat(fortune(), "\n")
          local plugins = "⚡Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          local version = "   v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
          local footer = "\n" .. version .. "\t" .. plugins

          dashboard.section.footer.val = footer
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}
