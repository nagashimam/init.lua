vim.cmd("filetype plugin on")

-- 他にも良さそうなプラグインがあるが、使いこなしきれないので一旦ここまで
-- https://github.com/benbrastmckie/.config/blob/master/nvim/vim-plug/plugins.vim
local Plug = vim.fn['plug#']
vim.call('plug#begin','~/.config/nvim/plugged')
  Plug('lervag/vimtex',{["for"] = "tex"})
  Plug('unblevable/quick-scope')
  Plug('easymotion/vim-easymotion')
  Plug('cocopon/iceberg.vim')
  Plug('neovim/nvim-lspconfig')
vim.call('plug#end')

vim.g.vimtex_view_method = 'skim'

vim.g.background = 'dark'
vim.opt.showcmd = false -- デフォルト設定が上書きされているよう
vim.cmd 'colorscheme iceberg'

vim.g.netrw_banner = 0        
vim.g.netrw_browse_split = 4  
vim.g.netrw_altv = 1          
vim.g.netrw_liststyle = 3     
