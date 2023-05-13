return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.rust", enabled = true },
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
          highlight = "Cursor",
        },
        hover_actions = {
          border = {
            { "╒", "FloatBorder" },
            { "═", "FloatBorder" },
            { "╕", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╛", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╘", "FloatBorder" },
            { "│", "FloatBorder" },
          },
          auto_focus = true,
        },
      },
      server = {
        -- standalone file support
        -- setting it to false may improve startup time
        standalone = true,
        settings = {
          ["rust-analyzer"] = {
            lens = {
              enable = true,
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
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
}
