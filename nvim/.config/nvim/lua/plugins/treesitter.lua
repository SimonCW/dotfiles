-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "rust",
      "python",
      "toml",
      "json",
      "markdown",
      "yaml",
      "markdown_inline",
    },
  },
}
