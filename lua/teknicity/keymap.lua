local km = vim.keymap

vim.g.mapleader = ' '

-- Netrw folder navigation
km.set("n", "<leader>pv", vim.cmd.Ex)

-- Packer sync command
km.set("n", "<leader>ps", ":PackerSync <CR>")

-- Move visual selection up and down
km.set("v", "J", ":m '>+1<CR>gv=gv")
km.set("v", "K", ":m '<-2<CR>gv=gv")

-- Navigation middle/top screen
km.set("n", "J", "mzJ`z")
km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")

-- Search up/down
km.set("n", "n", "nzzzv")
km.set("n", "N", "Nzzzv")

-- Greatest remap ever
km.set("x", "<leader>p", [["_dP]])

-- Next greatest remap ever : asbjornHaland
km.set({ "n", "v" }, "<leader>y", [["+y]])
km.set("n", "<leader>Y", [["+Y]])

km.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
km.set("i", "<C-c>", "<Esc>")

km.set("n", "Q", "<nop>")
--km.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
km.set("n", "<leader>f", vim.lsp.buf.format)

-- Navigate quickfix windows
km.set("n", "<C-k>", "<cmd>cnext<CR>zz")
km.set("n", "<C-j>", "<cmd>cprev<CR>zz")
km.set("n", "<leader>k", "<cmd>lnext<CR>zz")
km.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Substitution pattern for word under cursor
km.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current buffer executable
km.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Animation
km.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- Source changes
km.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- Git commands
km.set("n", "<leader>gs", "<cmd>bo Git<CR>")
km.set("n", "<leader>ga", "<cmd>Gwrite<CR>")
km.set("n", "<leader>gc", "<cmd>Git commit --verbose<CR>")
km.set("n", "<leader>gsh", "<cmd>Git push<CR>")
km.set("n", "<leader>gll", "<cmd>Git pull<CR>")
km.set("n", "<leader>gb", "<cmd>Git blame<CR>")
km.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>")
km.set("n", "<leader>gr", "<cmd>GRemove<CR>")
km.set("n", "<leader>o", "<cmd>GBrowse<CR>")
km.set("n", "<leader>fgs", "<cmd>Neotree git_status<CR>")

-- Switch windows
km.set("n", "<C-J>", "<C-W><C-J>")
km.set("n", "<C-K>", "<C-W><C-K>")
km.set("n", "<C-L>", "<C-W><C-L>")
km.set("n", "<C-H>", "<C-W><C-H>")

-- Switch  tabs
km.set("n", "<C-T>n", "<cmd>tabnext<CR>")
km.set("n", "<C-T>p", "<cmd>tabprevious<CR>")
km.set("n", "<C-B>d", "<cmd>tabclose<CR>")
km.set("n", "<C-B>c", "<cmd>tabclose<CR>")

-- Switch buffer
km.set("n", "<C-B>n", "<cmd>bn<CR>")
km.set("n", "<C-B>p", "<cmd>bp<CR>")
km.set("n", "<C-B>d", "<cmd>bd<CR>")
km.set("n", "<C-B>c", "<cmd>bd<CR>")

-- Terminal navigation
km.set({ "n", "t" }, "<leader>t", "<cmd>ToggleTerm size=20<CR>")
km.set('t', '<esc>', [[<C-\><C-n>]])
km.set('t', 'jk', [[<C-\><C-n>]])
km.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]])
km.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]])
km.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]])
km.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]])

-- Tagbar popup
km.set("n", "<leader>df", "<cmd>TagbarToggle<CR>")

-- Fold
km.set('n', "<leader>fa", "za<CR>")
km.set('n', "<leader>fM", "zM<CR>")
km.set('n', "<leader>fr", "zR<CR>")
km.set('n', "<leader>fE", "zE<CR>")

-- Undotree
km.set("n", "<leader>u", vim.cmd.UndotreeToggle)
