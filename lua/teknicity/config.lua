local opt = vim.opt
local home = os.getenv('HOME')

-- Gui options
opt.guicursor = ''                                   -- Set gui cursor
opt.guifont = 'Hack Nerd Font'                       -- Set gui font
opt.termguicolors = true                             -- Use terminal gui colors
opt.background = 'dark'                              -- Set gui background
opt.mouse = 'a'                                      -- Mouse is active in all modes
opt.scrolloff = 8                                    -- Minimal number of lines to keep between above and below the cursor 

-- Terminal options
opt.cf = true                                        -- Enable error files & error jumping
opt.encoding = 'utf-8'                               -- File encoding
opt.history = 256                                    -- Number of operations to remember in history
opt.termencoding = 'utf-8'                           -- Terminal encoding
opt.backspace = 'indent,eol,start'                   -- Indentation on new line

-- Window options
opt.title = true                                     -- Window title
opt.titlestring= '%F'                                -- Title name as string
opt.autowrite = true                                 -- Writes on make/shell commands 
opt.number = true                                    -- Set lines number
opt.relativenumber = true                            -- Set relative lines number
opt.wrap = false                                     -- Don't wrap text to fit page size

-- Indentation options
opt.cindent = true                                   -- Set indentation
opt.cinwords= 'if,else,while,do,for,switch,case'     -- Words triggering indentation
opt.tabstop = 2                                      -- Default tab stop is 2 spaces
opt.softtabstop = 2                                  -- Default tag stop is 2 spaces
opt.shiftwidth = 2                                   -- How many columns to reindent
opt.expandtab = true                                 -- Replace tab characters by spaces
opt.autochdir = false                                -- Don't change dirs when opening files
opt.smartindent = true                               -- Use smart indentation 

-- Folding
--opt.foldenable = true                                -- Enable folding
--opt.foldmethod = 'syntax'                            -- Method to use for folding
--opt.foldlevel = 99                                   -- Max level for folding
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldenable = false

-- Backup options
opt.backup = true                                    -- Activate file backup
opt.backupdir = home  .. '/.vim/backups'             -- Backup directory
opt.directory = home.. '/.vim/tmp'                   -- Temporary directory
opt.undodir = home .. '/.vim/undodir'                -- Directory for undo actions
opt.undofile = true                                  -- Use file for undoing actions
opt.laststatus = 2                                   -- Shows a marker for modified file
opt.updatetime = 5                                   -- The time before flushing changes
opt.swapfile = false                                 -- Don't use swapfile

-- Search options
opt.hlsearch = false                                 -- Don't highlight search results
opt.incsearch = true                                 -- Search incrementally
opt.signcolumn = 'yes'                               -- Sign column
opt.isfname:append("@-@")                            -- Add @ character to allowed filenames
