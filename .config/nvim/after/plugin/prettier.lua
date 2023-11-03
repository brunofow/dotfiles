local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
    "php"
  },
  cli_options = {
    arrow_parenns = "avoid",
    bracketSpacing = true,
    tab_width = 2,
    print_width = 120,
    end_of_line = "auto",
    semi = false
  }
})
