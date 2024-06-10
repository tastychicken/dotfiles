-- custom binds
-- C is the CTRL key
-- S is the SHIFT key
-- <CR> is carriage return for commands
-- <silent> makes commands that might display stuff be silent

-- set leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- goto-preview
vim.keymap.set("", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>")
vim.keymap.set("", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<cr>")
vim.keymap.set("", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>")
vim.keymap.set("", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<cr>")
vim.keymap.set("", "<C-c>", "<cmd>lua require('goto-preview').close_all_win()<cr>")
vim.keymap.set("", "<Esc>", "<cmd>lua require('goto-preview').close_all_win()<cr>")

-- trouble
vim.keymap.set("n", "<leader>td", function() require("trouble").toggle("diagnostics") end)
vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>tl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "<leader>tr", function() require("trouble").toggle("lsp_references") end)
vim.keymap.set("n", "<leader>ts", function() require("trouble").toggle("symbols") end)

-- hover
vim.keymap.set("n", "<leader>h", require("hover").hover, {desc = "hover.nvim"})
vim.keymap.set("n", "<leader>hs", require("hover").hover_select, {desc = "hover.nvim (select)"})

-- Visual block with Shift+f (normal keybind disrupted because of terminal)
vim.keymap.set("", "<S-f>", "<c-v>")

-- reload config
vim.keymap.set("", "<leader>r", ":source $HOME/.config/nvim/init.lua<CR>")
