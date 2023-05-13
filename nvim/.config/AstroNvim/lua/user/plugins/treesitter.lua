return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "lua", "rust", "python" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
}
