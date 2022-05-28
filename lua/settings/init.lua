function setRecursivePath()
  local defaultPath = vim.o.path
  local handle = io.popen([[find . -type d \( -name 'node_modules' -o -name '.git' -o -name '.angular' -o -name '.vscode' -o -name 'dist' -o -name 'libs' \) -prune -o -type d | tr '\n' ',' | sed 's/\.\///g' | sed 's/,$//']])
  local additionalPath = handle:read()
  handle:close()
  vim.cmd("setlocal path=" .. defaultPath .. "," .. additionalPath)
end

--[[
デフォルト値は""。カンマ区切りなので、デフォルトから変えている場合は
vim.o.clipboard = vim.o.clipboard .. ",unnamedplus"
]]
vim.o.clipboard = "unnamedplus"

vim.o.wildmenu = true

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

vim.api.nvim_create_user_command("RecursivePath",function() setRecursivePath() end,{})

local id = vim.api.nvim_create_augroup("FileSystem", {})
vim.api.nvim_create_autocmd({"TabEnter", "BufEnter"}, {
  group = id,
  pattern = "*",
  command = "RecursivePath"
})
