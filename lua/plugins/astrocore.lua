-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

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
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
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
        -- second key is the lefthand side of the map

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

        ["fd"] = { "<esc>" },
        -- quick save
        ["<Leader>fs"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        ["<Leader>s"] = { name = "Searching" },
        -- ["<Leader>ss"] = { ":Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy find current buffer" },
        -- ["<Leader>sj"] = { ":Telescope jumplist<cr>", desc = "Jumplist" },
        ["<Leader>;"] = {
          function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Toggle comment",
        },
        ["<C-c><C-t>"] = {
          function()
            vim.lsp.buf.hover()
          end,
          desc = "Get type information LSP",
        },
        [","] = { name = "LSP Shortcuts" },
        [",h"] = { name = "LSP Help" },
        [",ht"] = {
          function()
            vim.lsp.buf.hover()
          end,
          desc = "Get type information LSP",
        },
        ["<Leader>w"] = { "<C-w>", desc = "Window management mode" },
        ["<Leader>m"] = { name = "Tab Shortcuts" },
        ["<Leader>mc"] = { ":tabnew<cr>", desc = "Tab new" },
        ["<Leader>mn"] = { ":tabnext<cr>", desc = "Tab next" },
        ["<Leader>mp"] = { ":tabprevious<cr>", desc = "Tab prev" },
        ["<Leader>ml"] = { ":tabs<cr>", desc = "Tab list" }
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
        ["fd"] = { "<C-\\><C-n>" },
        ["jj"] = { "<C-\\><C-n>" },
      },
      i = {
        ["<C-c><C-t>"] = {
          function()
            vim.lsp.buf.hover()
          end,
          desc = "Get type information LSP",
        },
      },
      v = {
        ["<Leader>;"] = {
          "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
          desc = "Toggle comment for selection"
        },
      },
    },
  },
}
