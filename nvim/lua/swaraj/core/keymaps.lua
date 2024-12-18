vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "<C-x>", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- when the text is select this will whole text up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep the courser at front and append the next to privous line  with space
vim.keymap.set("n", "J", "mzJ`z", { desc = "keep course at place and append the next to privous" })

--keep courour at middle whene half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "half page juming keep course in middle" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "half page juming keep course in middle" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })                   -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })                 -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })                    -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })               -- close current split window

keymap.set("n", "<C-n>", "<cmd>tabnew<CR>", { desc = "Open new tab" })            -- open new tab
keymap.set("n", "<C-x>", "<cmd>tabclose<CR>", { desc = "Close current tab" })     -- close current tab

--keymap.set("n", "<C-l>", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
-- Cyclical next tab
keymap.set("n", "<C-l>", function()
    if vim.fn.tabpagenr() == vim.fn.tabpagenr("$") then
        vim.cmd("tabfirst") -- Go to the first tab if on the last tab
    else
        vim.cmd("tabnext")  -- Go to the next tab
    end
end, { desc = "Go to next tab (cyclical)" })

--keymap.set("n", "<C-k>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
-- Cyclical previous tab
keymap.set("n", "<C-k>", function()
    if vim.fn.tabpagenr() == 1 then
        vim.cmd("tablast")     -- Go to the last tab if on the first tab
    else
        vim.cmd("tabprevious") -- Go to the previous tab
    end
end, { desc = "Go to previous tab (cyclical)" })

keymap.set("n", "<C-o>", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
