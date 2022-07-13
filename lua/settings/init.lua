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

vim.opt.showmode = false
vim.opt.scrolloff = 7

vim.bo.iskeyword = vim.bo.iskeyword .. ',-'

vim.g.mapleader = " "

-- cocを使うならこの2行が推奨設定
--vim.g.nobackup = true
--vim.g.nowritebackup = true

vim.wo.conceallevel = 2
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.linebreak = true

vim.api.nvim_create_user_command("RecursivePath",function() setRecursivePath() end,{})

