require('lualine').setup {
  options = {
    theme = 'auto' or 'rose-pine',
    disabled_filetypes = {
      statusline = { 'neo-tree', 'undotree', 'tagbar'}
    }
  },
  -- tabline = {
  --_a = {'buffers'},
  --_b = {},
  --_c = {},
  --_x = {},
  --_y = {},
  --_z = {'tabs'}
}
