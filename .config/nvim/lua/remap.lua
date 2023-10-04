print("loaded remap")

-- custom binds
-- <Leader> is '\'
-- C is the CTRL key
-- S is the SHIFT key
-- <CR> is carriage return for commands
-- <silent> makes commands that might display stuff be silent

-- goto-preview
vim.keymap.set("", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>")
vim.keymap.set("", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<cr>")
vim.keymap.set("", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>")
vim.keymap.set("", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<cr>")
vim.keymap.set("", "<C-c>", "<cmd>lua require('goto-preview').close_all_win()<cr>")
vim.keymap.set("", "<Esc>", "<cmd>lua require('goto-preview').close_all_win()<cr>")

-- trouble
vim.keymap.set("n", "<leader>tt", function() require("trouble").open() end)
vim.keymap.set("n", "<leader>tw", function() require("trouble").open("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>td", function() require("trouble").open("document_diagnostics") end)
vim.keymap.set("n", "<leader>tq", function() require("trouble").open("quickfix") end)
vim.keymap.set("n", "<leader>tl", function() require("trouble").open("loclist") end)
vim.keymap.set("n", "tr", function() require("trouble").open("lsp_references") end)

-- Visual block with Shift+f (normal keybind disrupted because of terminal)
vim.keymap.set("", "<S-f>", "<c-v>")

-- reload config
vim.keymap.set("", "<leader>r", ":source $HOME/.config/nvim/init.lua<CR>")
