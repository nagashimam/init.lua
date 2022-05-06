function findCloserBraceForward()
  local columnPosition,line = vim.fn.getpos(".")[3],vim.fn.getline(".")
  local target = string.sub(line, columnPosition + 1, #line)
  local result = findMatch({"「","『","』","」"}, target)
  if result then 
    vim.cmd("normal f" .. result)
  end
end

function findCloserBraceBackward()
  local columnPosition,line = vim.fn.getpos(".")[3],vim.fn.getline(".")
  local target = string.sub(line, 1, columnPosition - 1)
  local result = findMatch({"」","』","『","「"}, target)
  if result then 
    vim.cmd("normal F" .. result)
  end
end

function findMatch(candidates, str)
  for _, candidate in pairs(candidates) do
    if(string.find(str, candidate)) then
      return candidate
    end
  end
  return nil
end

vim.keymap.set("i", "jj", "<Esc>")

-- 履歴からコマンドを呼び出すときに、フィルタリングを行う
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")

vim.keymap.set({"n","v"}, "j", "gj")
vim.keymap.set({"n","v"}, "k", "gk")

vim.keymap.set("n", "<Leader>,", [[<Cmd>:nohl<CR>]])

vim.keymap.set("n", "fj,", "f、")
vim.keymap.set("n", "Fj,", "F、")
vim.keymap.set("n", "fj.", "f。")
vim.keymap.set("n", "Fj.", "F。")
vim.keymap.set("n", [[fj"]], function() findCloserBraceForward() end)
vim.keymap.set("n", [[Fj"]], function() findCloserBraceBackward() end)
