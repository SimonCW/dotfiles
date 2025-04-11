-- Customize Mason

return {
  -- use mason-tool-installer for automatically installing Mason packages
  ---@type LazySpec
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers

        "lua-language-server",
        "basedpyright",
        "markdown-oxide", -- lsp for working with obsidian files
        "dockerfile-language-server",
        "taplo",
        "yaml-language-server",
        "json-lsp",

        -- install formatters
        "stylua",
        "ruff",

        -- install debuggers

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
