return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, _)
            return name == ".." or name == ".git"
          end,
        },
      })

      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      vim.keymap.set("n", "<leader>pv", "<CMD>Oil .<CR>", { desc = "Open root directory" })
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      spec = {
        {
          { "<leader>p", group = "project" },
          { "<leader>h", group = "harpoon" },
        },
      },
    },
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = function()
      local keys = {
        {
          "<leader>ha",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Add file to harpoon",
        },
        {
          "<leader>hl",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Show harpoon file list",
        },
      }

      for i = 1, 5 do
        table.insert(keys, {
          "<leader>h" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to file " .. i,
        })
      end

      return keys
    end,
  },

  {
    "jaimecgomezz/here.term",
    opts = {
      mappings = {
        toggle = "<C-y>",
        kill = "<C-S-y>",
      },
    },
  },

  {
    "zbirenbaum/copilot.lua",
    opts = {},
  },

  {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              show_result_in_chat = true, -- Show mcp tool results in chat
              make_vars = true, -- Convert resources to #variables
              make_slash_commands = true, -- Add prompts as /slash commands
            },
          },
        },
        strategies = {
          chat = {
            adapter = "deepseek",
          },
          inline = {
            adapter = "deepseek",
          },
          agent = { adapter = "deepseek" },
        },
        adapters = {
          copilot = function()
            return require("codecompanion.adapters").extend("deepseek", {
              env = {
                api_key = "sk-904bce278cf0436e9f6d63dcd41878f7",
              },
            })
          end,
        },
      })
    end,
  },

  {
    "ravitemer/mcphub.nvim",
    build = "npm install -g mcp-hub@latest",
    config = function()
      require("mcphub").setup()
    end,
  },
}
