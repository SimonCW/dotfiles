return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "lua", "rust", "python", "toml", "json", "markdown", "markdown_inline" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
}
