set encoding=utf-8 " set encoding
scriptencoding utf-8

" plugins
call plug#begin()
  " nvim-tree
  " https://github.com/kyazdani42/nvim-web-devicons
  " https://github.com/kyazdani42/nvim-tree.lua
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'

  " mason
  " https://github.com/williamboman/mason.nvim
  " https://github.com/williamboman/mason-lspconfig.nvim
  " https://github.com/neovim/nvim-lspconfig
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'

  " nvim-cmp
  " https://github.com/hrsh7th/nvim-cmp
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  " vsnip
  " https://github.com/hrsh7th/vim-vsnip
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  " nvim-autopairs
  " https://github.com/windwp/nvim-autopairs
  Plug 'windwp/nvim-autopairs'

  " null-ls
  " https://github.com/jose-elias-alvarez/null-ls.nvim
  Plug 'jose-elias-alvarez/null-ls.nvim'

  " treesitter
  " https://github.com/nvim-treesitter/nvim-treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " nightfox theme
  " https://github.com/EdenEast/nightfox.nvim
  Plug 'EdenEast/nightfox.nvim'

  " airline
  " https://github.com/vim-airline/vim-airline
  " https://github.com/vim-airline/vim-airline-themes
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " telescope
  " https://github.com/nvim-telescope/telescope.nvim
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

  " goto-preview
  " https://github.com/rmagatti/goto-preview
  Plug 'rmagatti/goto-preview'
call plug#end()

" nvim-tree config
lua << EOF
  require('nvim-tree').setup({})
EOF
map <silent> <Leader>q :NvimTreeToggle<CR>
map <silent> <Leader>w :NvimTreeFocus<CR>

" mason config
lua << EOF
  require('mason').setup({
    check_outdated_packages_on_open=true,
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })

  require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'vimls' }
  })

  -- load language servers
  require('lspconfig')['tsserver'].setup({
    on_attach = on_attach,
    flags = lsp_flags,
  })
  require('lspconfig')['vimls'].setup({
    on_attach = on_attach,
    flags = lsp_flags,
  })
  require('lspconfig')['marksman'].setup({
    on_attach = on_attach,
    flags = lsp_flags,
  })
EOF

" nvim-cmp config
set completeopt=menu,menuone,noselect
lua << EOF
  local cmp = require('cmp')

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = {
      ["<S-Tab>"] = cmp.mapping.select_next_item(),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          local entry = cmp.get_selected_entry()
          if not entry then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            cmp.confirm()
          end
        else
          fallback()
        end
      end, {"i","s","c"}),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })

  -- config per filetype
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' },
    }, {
      { name = 'buffer' },
    })
  })

  -- config for search
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- config for command
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- set up capabilities
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  -- set capabilities to lsp
  require('lspconfig')['tsserver'].setup({
    capabilities = capabilities
  })
  require('lspconfig')['vimls'].setup({
    capabilities = capabilities
  })
  require('lspconfig')['marksman'].setup({
    capabilities = capabilities
  })
EOF

" nvim-autopairs config
lua << EOF
  require("nvim-autopairs").setup({
    disable_filetype = { "TelescopePrompt", "clap_input" },
    enable_check_bracket_line = false,
  })
EOF

" null-ls config
lua << EOF
  require('null-ls').setup({
    sources = {
      require('null-ls').builtins.diagnostics.standardjs,
      require('null-ls').builtins.diagnostics.vint,
    }
  })
EOF

" treesitter config
lua << EOF
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'css', 'gitignore', 'html', 'http', 'javascript', 'json', 'lua', 'sql', 'vim' },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting= false,
    },
  })
EOF

" nightfox config
lua << EOF
  require('nightfox').setup({
    options = {
      transparent = true,
    }
  })
EOF
colorscheme nightfox

" airline config
let g:airline_powerline_fonts=1
let g:airline_theme='wombat'

" telescope config
lua << EOF
  require('telescope').setup({
    defaults = {
      mappings = {
        i = {
          ["<Esc"] = require('telescope.actions').close,
          ["<C-c>"] = require('telescope.actions').close
        },
        n = {
          ["<Esc"] = require('telescope.actions').close,
          ["<C-c>"] = require('telescope.actions').close
        }
      }
    }
  })
EOF
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>

" goto-preview config
lua << EOF
  require('goto-preview').setup({})
EOF
nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<cr>
nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<cr>
nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<cr>
nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<cr>
nnoremap <C-c> <cmd>lua require('goto-preview').close_all_win()<cr>
nnoremap <Esc> <cmd>lua require('goto-preview').close_all_win()<cr>

" custom binds
" <Leader> is '\'
" C is the CTRL key
" S is the SHIFT key
" <CR> is carriage return for commands
" <silent> makes commands that might display stuff be silent

" Visual block with Shift+f (normal keybind disrupted because of terminal)
map <S-f> <c-v>

" reload config
nnoremap <leader>r :source $HOME/.config/nvim/init.vim<CR>

" sets
syntax on " syntax highlighting
set cmdheight=1 " height of command bar
set ruler " show current position
set number " show line numbers
set backspace=indent,eol,start " make backspace agt as it should
set tabstop=2 " show existing tab as X spaces
set smarttab " insert tabstop number of spaces when tab is pressed
set shiftwidth=2 " when indenting with '>' use X spaces width
set expandtab " use spaces instead of tabs
set clipboard=unnamedplus " interact with system clipboard
set directory^=$HOME/.swap/ " set swap file directory
set mouse=a " mouse scrolling
set ignorecase " ignore case when searching
set smartcase " attempt to resolve cases better when searching
set hlsearch " highlight search results
set incsearch " make search act like modern browsers
set showmatch " show matching brackets when indicator is over them

" highlight cursor line
set cursorline
hi CursorLine cterm=NONE ctermbg=234
hi CursorLineNr cterm=NONE

" attempt to reload files that were changed outside of vim
set autoread
augroup autoread
  au FocusGained,BufEnter * checktime
augroup end
