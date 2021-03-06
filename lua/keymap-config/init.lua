local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Custom
keymap("n" ,"<C-p>", ":Telescope find_files<cr>", opts)
keymap("n" ,"<leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n" ,"<leader>fb", ":Telescope buffers<cr>", opts)

keymap("n" ,"<C-b>", ":NvimTreeToggle<cr>", opts)
keymap("n" ,"<leader>r", ":NvimTreeRefresh<cr>", opts)
keymap("n" ,"<leader>n", ":NvimTreeFindFile<cr>", opts)

keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", opts)
keymap("n", "vs", ":vsplit<cr>", opts)
keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)

-- Bufferline --
keymap('n', '<leader>,', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<leader>.', ':BufferLineCyclePrev<CR>', opts)
