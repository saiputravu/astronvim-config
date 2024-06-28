return {
  {
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              -- unmap s
              ["s"] = { "s", desc = "" },
              -- map to t
              ["t"] = { "<Plug>(leap)", desc = "Leap" },
              ["S"] = { "<Plug>(leap-from-window)", desc = "Leap from window" },
              ["gs"] = {
                function()
                  require("leap").leap {
                    target_windows = require("leap.user").get_focusable_windows(),
                  }
                end,
                desc = "Leap from any window",
              },
            },
          },
        },
      },
    },
  },
}
