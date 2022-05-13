function findCloserBraceForward(command)
  local columnPosition,line = vim.fn.getpos(".")[3],vim.fn.getline(".")
  local target = string.sub(line, columnPosition + 1, #line)
  local result = findMatch({"「","『","』","」"}, target)
  if result then 
    vim.cmd("normal " .. command .. result)
  end
end

function findCloserBraceBackward(command)
  local columnPosition,line = vim.fn.getpos(".")[3],vim.fn.getline(".")
  local target = string.sub(line, 1, columnPosition - 1)
  local result = findMatch({"」","』","『","「"}, target)
  if result then 
    vim.cmd("normal " .. command .. result)
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

vim.keymap.set({"n", "v", "o"}, "fj,", "f、")
vim.keymap.set({"n", "v", "o"}, "Fj,", "F、")
vim.keymap.set({"n", "v", "o"}, "tj,", "t、")
vim.keymap.set({"n", "v", "o"}, "Tj,", "T、")

vim.keymap.set({"n", "v", "o"}, "fj.", "f。")
vim.keymap.set({"n", "v", "o"}, "Fj.", "F。")
vim.keymap.set({"n", "v", "o"}, "tj.", "t。")
vim.keymap.set({"n", "v", "o"}, "Tj.", "T。")

vim.keymap.set({"n", "v", "o"}, [[fj"]], function() findCloserBraceForward("f") end)
vim.keymap.set({"n", "v", "o"}, [[Fj"]], function() findCloserBraceBackward("F") end)
vim.keymap.set({"n", "v", "o"}, [[tj"]], function() findCloserBraceForward("t") end)
vim.keymap.set({"n", "v", "o"}, [[Tj"]], function() findCloserBraceBackward("T") end)
