-- Gui options
vim.opt.guicursor = ""
vim.opt.guifont = 'Hack Nerd Font'
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.mouse = 'a'
vim.opt.scrolloff = 8

-- Terminal options
vim.opt.cf = true
vim.opt.encoding = 'utf-8'
vim.opt.history = 256
vim.opt.termencoding = 'utf-8'
vim.opt.backspace = 'indent,eol,start'

-- Window options
vim.opt.title = true
vim.opt.titlestring= "%F"
vim.opt.autowrite = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cindent = true
vim.opt.cinwords= 'if,else,while,do,for,switch,case'
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.foldmethod = 'syntax'
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.autochdir = false
vim.opt.smartindent = true
vim.opt.wrap = false

-- Backup options
vim.opt.swapfile = false
vim.opt.backup = true
vim.opt.backupdir = os.getenv("HOME") .. '/.vim/backups'
vim.opt.directory = os.getenv("HOME") .. '/.vim/tmp'
vim.opt.undodir = os.getenv("HOME") .. '/.vim/undodir'
vim.opt.undofile = true
vim.opt.laststatus = 2
vim.opt.updatetime = 50

-- Hightlight options
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

