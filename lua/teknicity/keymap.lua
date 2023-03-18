vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- packer sync command 
vim.keymap.set("n", "<leader>ps", ":PackerSync <CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- Git
vim.keymap.set("n", "<leader>ga", "<cmd>Gwrite<CR>")
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit --verbose<CR>")
vim.keymap.set("n", "<leader>gsh", "<cmd>Git push<CR>")
vim.keymap.set("n", "<leader>gll", "<cmd>Git pull<CR>")
vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>")
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>")

vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>")
vim.keymap.set("n", "<leader>gr", "<cmd>GRemove<CR>")
vim.keymap.set("n", "<leader>o", "<cmd>GBrowse<CR>")

-- Change windows easily
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

-- Change tabs easily
vim.keymap.set("n", "<C-T>n", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<C-T>p", "<cmd>tabprevious<CR>")
vim.keymap.set("n", "<C-B>d", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<C-B>c", "<cmd>tabclose<CR>")

-- Change buffer
vim.keymap.set("n", "<C-B>n", "<cmd>bn<CR>")
vim.keymap.set("n", "<C-B>p", "<cmd>bp<CR>")
vim.keymap.set("n", "<C-B>d", "<cmd>bd<CR>")
vim.keymap.set("n", "<C-B>c", "<cmd>bd<CR>")

-- Terminal navigation
vim.keymap.set({ "n", "t" }, "<leader>t", "<cmd>ToggleTerm<CR>")
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
vim.keymap.set('t', 'jk', [[<C-\><C-n>]])
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]])
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]])
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]])
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]])

-- Tagbar popup
vim.keymap.set("n", "<leader>df", "<cmd>TagbarToggle<CR>")

-- Fold
-- vim.keymap.set('n', '<space>', "<cmd>za<CR>")

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
