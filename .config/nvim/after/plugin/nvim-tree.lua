-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]

-- OR setup with some options
require("nvim-tree").setup({
  open_on_setup = false,
  sort_by = "case_sensitive",
  view = {
    side = 'right',
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = false,
    indent_markers = {
      enable = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",

      }
    }
  },
  filters = {
    dotfiles = true,
  },
})
