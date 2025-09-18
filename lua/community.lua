-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.octo-nvim" },
  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.ocaml" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.colorscheme.gruvbox-baby" },
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  { import = "astrocommunity.color.transparent-nvim" },
}
