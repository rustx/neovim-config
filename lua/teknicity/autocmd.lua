local packer_user_config = vim.api.nvim_create_augroup('packer_user_config', { clear = false })

-- Regenerate compiled loader file on file save
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = 'packer.lua',
  group = packer_user_config,
  command = 'source <afile> | PackerCompile'
})

-- Clean end of lines at save
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = '*',
  command = '%s/\\s\\+$//e'
})
