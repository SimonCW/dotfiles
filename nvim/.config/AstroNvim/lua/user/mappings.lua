-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"

    -- LSP mappings
    ["gh"] = { "<cmd>lua vim.lsp.buf.hover()<CR>" },
    ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>" },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>" },
    ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>" },
    ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>" },
    ["gl"] = { "<cmd>lua vim.diagnostic.open_float()<CR>" },
    ["<leader>lI"] = { "<cmd>LspInstallInfo<cr>" },
    ["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>" },
    ["<leader>ls"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
    -- Navigate buffers
    ["<S-l>"] = { ":bnext<CR>" },
    ["<S-h>"] = { ":bprevious<CR>" },
    ["<S-q>"] = { ":bdelete<CR>" },
    -- Was here before
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
