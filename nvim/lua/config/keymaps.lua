local keymap = vim.keymap -- for conciseness

vim.g.mapleader = " "

keymap.set("x", "<leader>p", '"_dP') -- keep register when pasting/deleting
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

keymap.set("i", "<C-h>", "<Left>", { noremap = true, silent = true })
keymap.set("i", "<C-j>", "<Down>", { noremap = true, silent = true })
keymap.set("i", "<C-k>", "<Up>", { noremap = true, silent = true })
keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = true })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to up window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to down window" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>TO", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>TX", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>TN", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>TP", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set(
  "n",
  "<leader>TF",
  "<cmd>tabnew %<CR>",
  { desc = "Open current buffer in new tab" }
)

-- buffers
keymap.set("n", "<leader>bx", "<cmd>bdelete %<CR>", { desc = "Close current buffer" })
keymap.set("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true })
keymap.set("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true })

-- disable arrow keys
keymap.set("n", "<Up>", "<Nop>", { noremap = true, silent = true }) -- normal --
keymap.set("n", "<Down>", "<Nop>", { noremap = true, silent = true })
keymap.set("n", "<Left>", "<Nop>", { noremap = true, silent = true })
keymap.set("n", "<Right>", "<Nop>", { noremap = true, silent = true })
keymap.set("n", "<C-Up>", "<Nop>", { noremap = true, silent = true })
keymap.set("n", "<C-Down>", "<Nop>", { noremap = true, silent = true })
keymap.set("n", "<C-Left>", "<Nop>", { noremap = true, silent = true })
keymap.set("n", "<C-Right>", "<Nop>", { noremap = true, silent = true })
keymap.set("n", "<S-Up>", "<Nop>", { noremap = true, silent = true })
keymap.set("n", "<S-Down>", "<Nop>", { noremap = true, silent = true })
keymap.set("n", "<S-Left>", "<Nop>", { noremap = true, silent = true })
keymap.set("n", "<S-Right>", "<Nop>", { noremap = true, silent = true }) ----
keymap.set("i", "<Up>", "<Nop>", { noremap = true, silent = true }) -- insert --
keymap.set("i", "<Down>", "<Nop>", { noremap = true, silent = true })
keymap.set("i", "<Left>", "<Nop>", { noremap = true, silent = true })
keymap.set("i", "<Right>", "<Nop>", { noremap = true, silent = true })
keymap.set("i", "<C-Up>", "<Nop>", { noremap = true, silent = true })
keymap.set("i", "<C-Down>", "<Nop>", { noremap = true, silent = true })
keymap.set("i", "<C-Left>", "<Nop>", { noremap = true, silent = true })
keymap.set("i", "<C-Right>", "<Nop>", { noremap = true, silent = true })
keymap.set("i", "<S-Up>", "<Nop>", { noremap = true, silent = true })
keymap.set("i", "<S-Down>", "<Nop>", { noremap = true, silent = true })
keymap.set("i", "<S-Left>", "<Nop>", { noremap = true, silent = true })
keymap.set("i", "<S-Right>", "<Nop>", { noremap = true, silent = true }) ----
keymap.set("v", "<Up>", "<Nop>", { noremap = true, silent = true }) -- visual --
keymap.set("v", "<Down>", "<Nop>", { noremap = true, silent = true })
keymap.set("v", "<Left>", "<Nop>", { noremap = true, silent = true })
keymap.set("v", "<Right>", "<Nop>", { noremap = true, silent = true })
keymap.set("v", "<C-Up>", "<Nop>", { noremap = true, silent = true })
keymap.set("v", "<C-Down>", "<Nop>", { noremap = true, silent = true })
keymap.set("v", "<C-Left>", "<Nop>", { noremap = true, silent = true })
keymap.set("v", "<C-Right>", "<Nop>", { noremap = true, silent = true })
keymap.set("v", "<S-Up>", "<Nop>", { noremap = true, silent = true })
keymap.set("v", "<S-Down>", "<Nop>", { noremap = true, silent = true })
keymap.set("v", "<S-Left>", "<Nop>", { noremap = true, silent = true })
keymap.set("v", "<S-Right>", "<Nop>", { noremap = true, silent = true }) ----
