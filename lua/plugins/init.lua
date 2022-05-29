vim.cmd("filetype plugin on")

-- 他にも良さそうなプラグインがあるが、使いこなしきれないので一旦ここまで
-- https://github.com/benbrastmckie/.config/blob/master/nvim/vim-plug/plugins.vim
local Plug = vim.fn['plug#']
vim.call('plug#begin','~/.config/nvim/plugged')
  Plug('lervag/vimtex',{["for"] = "tex"})
  Plug('preservim/vim-markdown',{["for"] = "markdown"})
  Plug('godlygeek/tabular',{["for"] = "markdown"}) -- vim-markdownのテーブル整形に必要
  Plug('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && yarn install',['for'] = 'markdown'})
  Plug('unblevable/quick-scope')
  Plug('easymotion/vim-easymotion')
  Plug('rakr/vim-one')
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes' 
vim.call('plug#end')

vim.g.vimtex_view_method = 'skim'

vim.g.airline_theme = 'one'
vim.g.background = 'dark'
vim.opt.showcmd = false -- デフォルト設定が上書きされているよう
vim.cmd 'colorscheme one'

vim.g.netrw_banner = 0        
vim.g.netrw_browse_split = 4  
vim.g.netrw_altv = 1          
vim.g.netrw_liststyle = 3     
