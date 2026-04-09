-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap

local util = require("util")

util.cowboy()

keymap.set("x", "<leader>p", '"_dP')
keymap.set("i", "<C-c>", "<Esc>")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", ";", ":")

keymap.set("n", "<C-x>", "<cmd>normal! ciw<cr>i")

keymap.set("n", "<leader>space", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
