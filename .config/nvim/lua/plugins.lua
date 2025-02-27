return require('packer').startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use "EdenEast/nightfox.nvim"

  use { "nvim-treesitter/nvim-treesitter", {run =  ":TSUpdate"} }

  use {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {}
    end
  }

  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }

  use "nvim-tree/nvim-web-devicons"

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true }
  }

  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons"
    }
  }

  use {
    "folke/trouble.nvim",
    requires = {
      "nvim-tree/nvim-web-devicons",
      opt = true
    },
    config = function()
      require("nvim-web-devicons").setup {}
      require("trouble").setup {
        focus = true
      }
    end
  }

  use "neovim/nvim-lspconfig"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"

  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      {"williamboman/mason.nvim"},
      {"williamboman/mason-lspconfig.nvim"},

      -- LSP Support
      {"neovim/nvim-lspconfig"},

      -- Autocompletion
      {"hrsh7th/nvim-cmp"},
      {"hrsh7th/cmp-nvim-lsp"},
      {"L3MON4D3/LuaSnip"},
    }
  }

  use { "L3MON4D3/LuaSnip" }
  use {
    "hrsh7th/nvim-cmp",
    config = function ()
      local cmp = require("cmp")
      cmp.setup {
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end
      },

      sources = {
        { name = "luasnip" },
        -- more sources
      },
      run = "make install_jsregexp"
    }
    end
  }
  use { "saadparwaiz1/cmp_luasnip" }

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
    end
  }

  use "habamax/vim-godot"

  use({
    "jackMort/ChatGPT.nvim",
      config = function()
        require("chatgpt").setup({
          api_key_cmd = "op read 'op://private/ChatGPT API Key/Password' --no-newline",
          api_host_cmd = "echo -n https://api.openai.com/v1/chat/completions",
          api_type_cmd = "echo chat",
          api_model = "echo gpt-4-turbo"
        })
      end,
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
  })

  -- install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })
  
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
end)
