-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Install packer if does not exist
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local present
local packer

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  }

  vim.cmd "packadd packer.nvim"

  present, packer = pcall(require, "packer")

  if present then
    print "Packer cloned successfully."
  else
    error(string.format(
      "Couldn't clone packer!\nPacker path: %s\n%s",
      install_path,
      packer
    ))

    return
  end
end

local packer_user_config = vim.api.nvim_create_augroup('packer_user_config', { clear = false })
-- Regenerate compiled loader file on file save
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = 'plugins.lua',
  group = packer_user_config,
  command = 'source <afile> | PackerCompile'
})

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = '*',
  command = '%s/\\s\\+$//e'
})

-- Load required plugins
packer = packer or require("packer")
-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Colorschemes
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use 'marko-cerovac/material.nvim'
  use 'gbprod/nord.nvim'

  use {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup {
        icons = false,
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'nvim-treesitter/playground'
  use 'theprimeagen/harpoon'
  use 'theprimeagen/refactoring.nvim'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'airblade/vim-gitgutter'
  use 'nvim-treesitter/nvim-treesitter-context'

  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = function()
      require('toggleterm').setup {
        shade_terminals = false
      }
    end
  }
  use 'majutsushi/tagbar'
  use 'ludovicchabant/vim-gutentags'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use 'github/copilot.vim'
  use 'eandrju/cellular-automaton.nvim'
  use 'laytan/cloak.nvim'

  use 'fatih/vim-go'
  use 'honza/vim-snippets'
  use 'vim-scripts/grep.vim'
  use 'powerline/powerline'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end
  }

  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        's1n7ax/nvim-window-picker',
        tag = 'v1.*',
        config = function()
          require 'window-picker'.setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
                -- if the buffer type is one of following, the window will be ignored
                buftype = { 'terminal', 'quickfix' },
              },
            },
            other_win_hl_color = '#e35e4f',
          })
        end,
      }
    },
    config = function()
      -- Unless you are still migrating, remove the deprecated commands from v1.x
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define('DiagnosticSignError',
        { text = " ", texthl = 'DiagnosticSignError' })
      vim.fn.sign_define('DiagnosticSignWarn',
        { text = " ", texthl = 'DiagnosticSignWarn' })
      vim.fn.sign_define('DiagnosticSignInfo',
        { text = " ", texthl = 'DiagnosticSignInfo' })
      vim.fn.sign_define('DiagnosticSignHint',
        { text = "", texthl = 'DiagnosticSignHint' })
      -- NOTE: this is changed from v1.x, which used the old style of highlight groups
      -- in the form "LspDiagnosticsSignWarning"


      vim.cmd([[nnoremap \ :Neotree toggle<cr>]])
    end
  }

  use 'nvim-tree/nvim-web-devicons'
  use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }

  -- using packer.nvim
  use { 'akinsho/bufferline.nvim', tag = 'v3.*', requires = 'nvim-tree/nvim-web-devicons' }

  -- hashicorp setup
  use 'hashivim/vim-terraform'
  use 'hashivim/vim-vagrant'
  use 'hashivim/vim-consul'
  use "hashivim/vim-packer"
  use "hashivim/vim-nomadproject"

  -- docker/kubernetes
  use 'andrewstuart/vim-kubernetes'
  use 'danishprakash/vim-docker'
  use 'towolf/vim-helm'
end)
