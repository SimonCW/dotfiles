-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua", enabled = true },
  { import = "astrocommunity.pack.bash", enabled = true },
  { import = "astrocommunity.pack.markdown", enabled = true },
  { import = "astrocommunity.pack.php", enabled = true },
  { import = "astrocommunity.pack.typescript", enabled = true },
  { import = "astrocommunity.markdown-and-latex.markview-nvim", enabled = false },
  -- import/override with your plugins folder
  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
  {
    -- further customize the options set by the community
    "catppuccin",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
    },
  },
}
