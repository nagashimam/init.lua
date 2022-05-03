vim.g.mapleader = " "

--[[
デフォルト値は""。カンマ区切りなので、デフォルトから変えている場合は
vim.o.clipboard = vim.o.clipboard .. ",unnamedplus"
]]
vim.o.clipboard = "unnamedplus"

vim.o.smarttab = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.history = 200
vim.o.splitright = true
