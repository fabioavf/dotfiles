-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- General keymaps
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>Q", ":qa!<CR>", { desc = "Force quit all" })
keymap.set("n", "<leader>x", ":x<CR>", { desc = "Save and quit" })

-- Clear search highlights
keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Delete single character without copying into register
keymap.set("n", "x", '"_x')

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })

-- Buffer navigation
keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Stay in indent mode when indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Move text up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- Keep cursor in place when joining lines
keymap.set("n", "J", "mzJ`z")

-- Keep cursor centered when jumping
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Don't overwrite register when pasting over selection
keymap.set("x", "p", [["_dP]])

-- NvimTree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Telescope (will be installed later)
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags" })

-- LSP keymaps (will be set up in lsp.lua)

-- Toggleterm
keymap.set("n", "<leader>t", ":ToggleTerm direction=float<CR>", { desc = "Toggle terminal" })
keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Escape terminal mode" })
