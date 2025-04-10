return { -- override blink.cmp plugin
  "Saghen/blink.cmp",
  opts = {
    sources = {
      providers = {

        path = { score_offset = 3 },
        lsp = { score_offset = 0 },
        buffer = { score_offset = -3 },
      },
    },
  },
}
