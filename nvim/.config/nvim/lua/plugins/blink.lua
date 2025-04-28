return { -- override blink.cmp plugin
  "Saghen/blink.cmp",
  -- dependencies = { "fang2hou/blink-copilot" },
  opts = {
    sources = {
      providers = {
        path = { score_offset = 100 },
        lsp = { score_offset = 80 },
        buffer = { score_offset = 60 },
        -- copilot = {
        --   name = "copilot",
        --   module = "blink-copilot",
        --   score_offset = 100,
        --   async = true,
        -- },
      },
    },
  },
}
