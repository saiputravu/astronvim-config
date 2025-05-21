return {
  "lervag/vimtex",
  lazy = false, -- disable lazy-loading for vimtex if needed
  init = function() vim.g.vimtex_view_method = "zathura" end,
}
