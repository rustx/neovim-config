vim.opt.background = 'dark'

-- Enable colors in the terminal.
if vim.fn.has('termguicolors') then
  vim.cmd('set termguicolors')
end

require 'teknicity.theme.rose-pine'
-- require 'teknicity.theme.nord'
-- require 'teknicity.theme.material'
-- require 'teknicity.theme.github'
