return require('packer').startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use "EdenEast/nightfox.nvim"

  use { "nvim-treesitter/nvim-treesitter", {run =  ":TSUpdate"} }

  use "rmagatti/goto-preview"

  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true }
  }

  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.3",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  use {
    "folke/trouble.nvim",
    require = { "nvim-tree/nvim-web-devicons", opt = true }
  }

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
  
      -- LSP Support
      {'neovim/nvim-lspconfig'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  use { 'L3MON4D3/LuaSnip' }
  use {
    'hrsh7th/nvim-cmp',
    config = function ()
      require'cmp'.setup {
      snippet = {
        expand = function(args)
          require'luasnip'.lsp_expand(args.body)
        end
      },
  
      sources = {
        { name = 'luasnip' },
        -- more sources
      },
    }
    end
  }
  use { 'saadparwaiz1/cmp_luasnip' }

  use {
    "lewis6991/hover.nvim",
    config = function()
        require("hover").setup {
            init = function()
                -- Require providers
                require("hover.providers.lsp")
                -- require('hover.providers.gh')
                -- require('hover.providers.gh_user')
                -- require('hover.providers.jira')
                -- require('hover.providers.man')
                -- require('hover.providers.dictionary')
            end,
            preview_opts = {
                border = nil
            },
            -- Whether the contents of a currently open hover window should be moved
            -- to a :h preview-window when pressing the hover keymap.
            preview_window = false,
            title = true
        }

        -- Setup keymaps
        vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
        vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
    end
  }

  use "hrsh7th/nvim-cmp"

end)
