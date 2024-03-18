local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left"},
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right"},
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down"},
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up"},

    ["<leader>h"] = {"<cmd> split<CR>", "Split window horizontally"},
    ["<leader>v"] = {"<cmd> vsplit<CR>", "Split window vertically",},

    ["<D-l>"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
  }
}

M.lspconfig = {
  plugin = true,
  n = {
    ["<D-B>"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },
    ["<D-b>"] = {
      function()
        require('telescope.builtin').lsp_references()
      end,
      "LSP references",
    },
    ["<D-R>"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },
  }
}



M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<D-F>"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<D-f>"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },


    -- bookmarks 
    ["<D-2>"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}


M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<D-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<D-/>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}


M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<D-T>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<D-j>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<D-J>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<D-T>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<D-j>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<D-J>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },
}


M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line"},
    ["<leader>dr"] = {"<cmd> DapContinue <CR>", "Start or continue the debugger"}
  }
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<D-1>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

return M
