return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader><space>", false },
      { "<leader>/", false },

      {
        "<leader><space>",
        function()
          require("telescope.builtin").find_files({
            hidden = true,
            no_ignore = false,
            follow = true,
          })
        end,
        desc = "Find files (custom)",
      },
      { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find files" },

      {
        "<leader>ps",
        function()
          require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
        end,
        desc = "Find words",
      },

      {
        "<leader>gb",
        function()
          require("telescope.builtin").git_branches({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find git branches",
      },

      {
        "<C-p>",
        function()
          require("telescope.builtin").git_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find git ignore files",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        wrap_results = true,

        -- "flex" = tenta horizontal (results esquerda / preview direita),
        -- mas troca para vertical/sem preview quando a janela é pequena.
        layout_strategy = "flex",
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",

          -- se a janela for menor que isso, o preview some
          preview_cutoff = 120,

          -- preferências quando couber horizontal (left/right)
          horizontal = {
            preview_width = 0.55,
            width = 0.95,
            height = 0.85,
          },

          -- fallback quando não couber horizontal
          vertical = {
            width = 0.95,
            height = 0.90,
          },
        },
      })

      -- aplica especificamente ao picker find_files (vale também pro <leader>pf)
      opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
        find_files = {
          previewer = true, -- sempre tentar preview
        },
      })

      telescope.setup(opts)
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = (build_cmd ~= "cmake") and "make"
      or "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    enabled = build_cmd ~= nil,
    config = function(plugin)
      LazyVim.on_load("telescope.nvim", function()
        local ok, err = pcall(require("telescope").load_extension, "fzf")
        if not ok then
          local lib = plugin.dir .. "/build/libfzf." .. (LazyVim.is_win() and "dll" or "so")
          if not vim.uv.fs_stat(lib) then
            LazyVim.warn("`telescope-fzf-native.nvim` not built. Rebuilding...")
            require("lazy").build({ plugins = { plugin }, show = false }):wait(function()
              LazyVim.info("Rebuilding `telescope-fzf-native.nvim` done.\nPlease restart Neovim.")
            end)
          else
            LazyVim.error("Failed to load `telescope-fzf-native.nvim`:\n" .. err)
          end
        end
      end)
    end,
  },
}
