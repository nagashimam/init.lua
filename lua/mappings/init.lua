-- selectLhs=trueの場合、左側にある文字を返す(LtR言語前提)。selectLhs=falseの場合右側
-- char1/char2ともに文字列に含まれない場合nilを返す
function selectCharacter(char1, char2, str, selectLhs)
  local char1Position = string.find(str, char1)
  local char2Position = string.find(str, char2)
  if not (char1Position or char2Position) then
    return nil
  elseif (char1Position and char2Position) then
    local char1IsLhs = char1Position < char2Position
    if char1IsLhs then
      return (selectLhs and char1 ) or char2
    else 
      return (selectLhs and char2 ) or char1
    end
  else 
    return (char1Position and char1) or char2
  end
end

function findCommaOrTennForward()
  local columnPosition,line = vim.fn.getpos(".")[3],vim.fn.getline(".")
  local target = string.sub(line, columnPosition + 1, #line)
  local result = selectCharacter(",", "、", target, true)
  if result then 
    vim.cmd("normal f" .. result)
  end
end

function findCommaOrTennBackward()
  local columnPosition,line = vim.fn.getpos(".")[3],vim.fn.getline(".")
  local target = string.sub(line, 1, columnPosition - 1)
  local result = selectCharacter(",", "、", target, false)
  if result then 
    vim.cmd("normal F" .. result)
  end
end

vim.keymap.set("i", "jj", "<Esc>")

-- 履歴からコマンドを呼び出すときに、フィルタリングを行う
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")

vim.keymap.set({"n","v"}, "j", "gj")
vim.keymap.set({"n","v"}, "k", "gk")
vim.keymap.set("n", "<Leader>,", [[<Cmd>:nohl<CR>]])

-- 「、」にもfやFができるようにする
vim.keymap.set("n", "fj,", function() findCommaOrTennForward() end)
vim.keymap.set("n", "Fj,", function() findCommaOrTennBackward() end)

-- テスト
-- 君は「Hello, world.」、と言った
-- 君は、「Hello, world.」と言った


