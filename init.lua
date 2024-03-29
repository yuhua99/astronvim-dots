return {
  colorscheme = "catppuccin",
  plugins = {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.colorscheme.catppuccin" },
    -- language packs
    { import = "astrocommunity.pack.go"},
    -- community plugins
    { import = "astrocommunity.completion.copilot-lua"},
    -- core plugins
    "nvim-telescope/telescope.nvim",
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      config = function()
        require("telescope").setup {
          extensions = {
            live_grep_args = {
              auto_quoting = true,
              mappings = {
                i = {
                  ["<Tab>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " -g *." }),
                  ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
                },
              },
            },
          },
        }

        require("telescope").load_extension("live_grep_args")
      end,
    },
    -- other plugins
    {
      "ibhagwan/smartyank.nvim",
      event = "User AstroFile",
    }
  },
  mappings = {
    n = {
      ["<leader>fw"] = { function() require("telescope").extensions.live_grep_args.live_grep_args() end, desc = "Find words" },
      ["<leader>fW"] = { function()
          require("telescope").extensions.live_grep_args.live_grep_args {
            default_text = "--no-ignore ",
          }
        end,
        desc = "Find words in all files",
      },
    }
  },
}
