local plugins = {
  {
   "nvim-telescope/telescope.nvim",
   opts = {
     defaults = {
       mappings = {
         i = {
           ["<C-j>"] = function(...)
               require("telescope.actions").move_selection_next(...)
            end,
           ["<C-k>"] = function(...)
               require("telescope.actions").move_selection_previous(...)
            end,
          },
        },
      },
    },
   },
   {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
      })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      require('dapui').setup({
        sidebar = {
          elements = {
            { id = 'scopes', size = 0.2 },       -- Scopes section
            { id = 'stacks', size = 0.3 },       -- Stack traces section
            { id = 'watches', size = 0.3 },      -- Watches section
            { id = 'breakpoints', size = 0.2 },  -- Breakpoints section
          },
          size = 35,
          position = 'bottom',
        },
      })


      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap"
    },
    opts = {
      handlers = {},
    }
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "nil",
        "nixpkgs-fmt",
        -- C/C++ 
        "clangd",
        "codelldb",
      }
    }
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup()
      end
  }
}

return plugins
