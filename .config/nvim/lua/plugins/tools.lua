return {
  {
    "tpope/vim-fugitive",
  },
  {
    "midoBB/nvim-quicktype",
    cmd = "QuickType",
    ft = { "typescript", "python", "java", "go", "rust", "cs", "swift", "elixir", "kotlin", "typescriptreact" },
  },
  {
    "smjonas/inc-rename.nvim",
    keys = {
      { "<leader>cr", ":IncRename ", desc = "Rename under cursor" },
    },
  },
}
