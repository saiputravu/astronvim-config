-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
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
    ["fd"] = { "<esc>" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>fs"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>s"] = { name = "Searching" },
    -- ["<leader>ss"] = { ":Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy find current buffer" },
    -- ["<leader>sj"] = { ":Telescope jumplist<cr>", desc = "Jumplist" },
    ["<leader>;"] = { 
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
    ["<leader>w"] = { "<C-w>", desc = "Window management mode" }
    
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
    ["<leader>;"] = {
      "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
      desc = "Toggle comment for selection"
    },
  },
}
