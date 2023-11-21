vim.opt.syntax = "on" -- syntax highlighting
vim.opt.cmdheight = 1 -- height of command bar
vim.opt.ruler = true -- show current position
vim.opt.number = true -- show line numbers
vim.opt.backspace = "indent,eol,start" -- make backspace agt as it should
vim.opt.tabstop = 2 -- show existing tab as X spaces
vim.opt.smarttab = true -- insert tabstop number of spaces when tab is pressed
vim.opt.shiftwidth = 2 -- when indenting with '>' use X spaces width
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.clipboard = "unnamedplus" -- interact with system clipboard
vim.opt.directory = "$HOME/.swap/" -- set swap file directory
vim.opt.mouse = "a" -- mouse scrolling
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- attempt to resolve cases better when searching
vim.opt.hlsearch = true -- highlight search results
vim.opt.incsearch = true -- make search act like modern browsers
vim.opt.showmatch = true -- show matching brackets when indicator is over them

-- highlight cursor line
vim.opt.cursorline = true
-- hi CursorLine cterm=NONE ctermbg=234
-- hi CursorLineNr cterm=NONE

-- attempt to reload files that were changed outside of vim
vim.opt.autoread = true

-- colorscheme
vim.cmd.colorscheme "nightfox"
vim.api.nvim_set_hl(0, "Normal", {guibg=NONE, ctermbg=NONE})
