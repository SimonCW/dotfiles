-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = true, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
      -- diagnostics_mode = 2, -- diagnostic mode on start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = false,
      virtual_lines = false,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        --conceallevel = 2,
        clipboard = "",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {

        -- Migrated from old config. What do I want to keep? #TODO:
        -- second key is the lefthand side of the map
        -- gd = { function() vim.lsp.buf.definition() end, desc = "Definition" },
        -- gs = { function() vim.lsp.buf.signature_help() end, desc = "Signature Help" },
        -- gh = { function() vim.lsp.buf.hover() end, desc = "Also Hover like K" },
        -- gD = { function() vim.lsp.buf.declaration() end, desc = "Declaration" },
        -- gI = {
        --   function() vim.lsp.buf.implementation() end,
        --   desc = "Implementation",
        -- },
        -- gr = { function() vim.lsp.buf.references() end, desc = "References" },
        -- ga = { function() vim.lsp.buf.code_action() end, desc = "Code Action" },

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- Copy to clipboard with leader key
        ["<Leader>y"] = { '"+y' },
        ["<Leader>p"] = { '"+p' },
        ["<Leader>P"] = { '"+P' },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,

        -- Resize. Check wezterm config for harmonized handling!
        ["<C-S-h>"] = { function() require("smart-splits").resize_left() end, desc = "Resize left" },
        ["<C-S-j>"] = { function() require("smart-splits").resize_down() end, desc = "Resize down" },
        ["<C-S-k>"] = { function() require("smart-splits").resize_up() end, desc = "Resize up" },
        ["<C-S-l>"] = { function() require("smart-splits").resize_right() end, desc = "Resize right" },
        ["<C-Left>"] = false,
        ["<C-Up>"] = false,
        ["<C-Down>"] = false,
        ["<C-Right>"] = false,
      },
      v = {
        -- Copy to clipboard with leader key
        ["<Leader>y"] = { '"+y' },
        ["<Leader>p"] = { '"+p' },
        ["<Leader>P"] = { '"+P' },
      },
    },
    autocmds = {
      -- conceal_zero = {
      --   desc = "Set conceallevel to 0 for file types like json and yaml. This allows to see quotation marks and such",
      --   event = "FileType",
      --   pattern = { "json", "yaml", "toml" },
      --   callback = function() vim.opt_local.conceallevel = 0 end,
      -- },
      textspellwrap = {
        {
          desc = "Enable spell and wrap for text documents",
          event = "FileType",
          pattern = {
            "gitcommit",
            "markdown",
            "text",
            "asciidoc",
          },
          callback = function()
            vim.opt_local.wrap = true
            vim.opt_local.spell = true
          end,
        },
      },
    },
  },
}
