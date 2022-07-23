-- theme folke/tokyonight.nvim config
--vim.cmd [[
--try
--  colorscheme darkplus
--catch /^Vim\%((\a\+)\)\=:E185/
--  colorscheme default
--  set background=dark
--endtry
--]]

-- theme deus config
vim.cmd [[ 
  try
    colors deus
    colorscheme deus
    let g:airline_theme='deus'

    set t_Co=256
    set termguicolors

    set background=dark
    
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    let g:deus_termcolors=256
  catch /^Vim\%((a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]
