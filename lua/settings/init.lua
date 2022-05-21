--[[
デフォルト値は""。カンマ区切りなので、デフォルトから変えている場合は
vim.o.clipboard = vim.o.clipboard .. ",unnamedplus"
]]
vim.o.clipboard = "unnamedplus"

vim.o.smarttab = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.history = 200
vim.opt.splitright = true
vim.o.splitright = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.g.mapleader = " "

vim.wo.conceallevel = 2
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true

vim.cmd("colorscheme elflord")
