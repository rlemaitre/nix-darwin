-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Remapping pour les accents en mode insertion
keymap.set("i", "<A-e>a", "á", { noremap = true, silent = true })
keymap.set("i", "<A-e>e", "é", { noremap = true, silent = true })
keymap.set("i", "<A-e>i", "í", { noremap = true, silent = true })
keymap.set("i", "<A-e>o", "ó", { noremap = true, silent = true })
keymap.set("i", "<A-e>u", "ú", { noremap = true, silent = true })
keymap.set("i", "<A-e>A", "Á", { noremap = true, silent = true })
keymap.set("i", "<A-e>E", "É", { noremap = true, silent = true })
keymap.set("i", "<A-e>I", "Í", { noremap = true, silent = true })
keymap.set("i", "<A-e>O", "Ó", { noremap = true, silent = true })
keymap.set("i", "<A-e>U", "Ú", { noremap = true, silent = true })

keymap.set("i", "<A-`>a", "á", { noremap = true, silent = true })
keymap.set("i", "<A-`>e", "é", { noremap = true, silent = true })
keymap.set("i", "<A-`>i", "í", { noremap = true, silent = true })
keymap.set("i", "<A-`>o", "ó", { noremap = true, silent = true })
keymap.set("i", "<A-`>u", "ú", { noremap = true, silent = true })
keymap.set("i", "<A-`>A", "Á", { noremap = true, silent = true })
keymap.set("i", "<A-`>E", "É", { noremap = true, silent = true })
keymap.set("i", "<A-`>I", "Í", { noremap = true, silent = true })
keymap.set("i", "<A-`>O", "Ó", { noremap = true, silent = true })
keymap.set("i", "<A-`>U", "Ú", { noremap = true, silent = true })

keymap.set("i", "<A-i>a", "â", { noremap = true, silent = true })
keymap.set("i", "<A-i>e", "ê", { noremap = true, silent = true })
keymap.set("i", "<A-i>i", "î", { noremap = true, silent = true })
keymap.set("i", "<A-i>o", "ô", { noremap = true, silent = true })
keymap.set("i", "<A-i>u", "û", { noremap = true, silent = true })
keymap.set("i", "<A-i>A", "Â", { noremap = true, silent = true })
keymap.set("i", "<A-i>E", "Ê", { noremap = true, silent = true })
keymap.set("i", "<A-i>I", "Î", { noremap = true, silent = true })
keymap.set("i", "<A-i>O", "Ô", { noremap = true, silent = true })
keymap.set("i", "<A-i>U", "Û", { noremap = true, silent = true })

keymap.set("i", "<A-u>a", "ä", { noremap = true, silent = true })
keymap.set("i", "<A-u>e", "ë", { noremap = true, silent = true })
keymap.set("i", "<A-u>i", "ï", { noremap = true, silent = true })
keymap.set("i", "<A-u>o", "ö", { noremap = true, silent = true })
keymap.set("i", "<A-u>u", "ü", { noremap = true, silent = true })
keymap.set("i", "<A-u>A", "Ä", { noremap = true, silent = true })
keymap.set("i", "<A-u>E", "Ë", { noremap = true, silent = true })
keymap.set("i", "<A-u>I", "Ï", { noremap = true, silent = true })
keymap.set("i", "<A-u>O", "Ö", { noremap = true, silent = true })
keymap.set("i", "<A-u>U", "Ü", { noremap = true, silent = true })
