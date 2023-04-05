local lsp = require("lsp-zero")

local servers = {
  'bashls',
  'docker_compose_language_service',
  'dockerls',
  'tsserver',
  'eslint',
  'rust_analyzer',
  'jedi_language_server',
  'jsonls',
  'lua_ls',
  'gopls',
  'golangci_lint_ls',
  'volar',
  'emmet_ls',
  'html',
  'cssls',
  'tsserver',
  'tailwindcss',
  'graphql',
  'prismals',
  'pylsp',
  'svelte',
  'sqlls',
  'tflint',
  'terraformls',
  'yamlls'
}

-- Use recommended presets
lsp.preset("recommended")

-- Install lsp servers
lsp.ensure_installed(servers)

-- -- Configure lsp servers basics
-- for _, s in pairs(servers) do
--   lsp.configure(s, {})
-- end

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lsp.configure('yamlls', {
  settings = {
    yaml = {
      keyOrdering = false
    }
  }
})

lsp.format_mapping('gq', {
  servers = {
    ['lua_ls']        = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
    ['yamlls']        = { 'yaml' },
    ['gopls']         = { 'go' },
    ['pylsp']         = { 'python' },
    ['tsserver']      = { 'typescript' },
    ['terraformls']   = { 'terraform' },
  }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
  ['<Enter>'] = cmp.mapping.confirm({ select = true }),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()


-- Troubleshoot configuration
-- :lua require('lsp-zero.check').run('lua_ls')
-- :lua require('lsp-zero.check').inspect_settings('tsserver')
-- :lua require('lsp-zero.check').inspect_server_config('tsserver')

vim.diagnostic.config({
  virtual_text = true
})
