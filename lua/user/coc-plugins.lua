-- coc-plugins
vim.g.coc_global_extensions = {
  'coc-marketplace',
  'coc-jedi',
  'coc-java'
}

vim.cmd([[
  augroup coc_user_config
    autocmd!
    autocmd BufWritePost coc-plugins.lua source <afile> 
  augroup end
]])

-- do something
-- vim.cmd([[CocRestart]])
-- restart coc to install coc-plugins
if vim.fn.exists(':CocInfo') == 2 then
  vim.cmd('CocRestart')
  -- vim.fn['coc#util#install']()
end

