return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.rust",              enabled = true },
  {
    "rust-tools.nvim",
    opts = {
      tools = {
        -- rust-tools options
        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
          auto = true,
          only_current_line = false,
          show_parameter_hints = true,
          highlight = "Comment",
        },
      },
      server = {
        -- standalone file support
        -- setting it to false may improve startup time
        standalone = true,
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              features = "all",
            },
            lens = {
              enable = false,
            },
            check = {
              command = "clippy",
            },
          },
        },
      }, -- rust-analyzer options
    },
  },
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
  {
    -- further customize the options set by the community
    "catppuccin",
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
    },
  },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
}
