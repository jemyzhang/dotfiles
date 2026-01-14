-- ~/.config/nvim/lua/config/keymaps.lua

-- 将 Leader 键设置为空格 (最常用的设置)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- 方便的保存和退出
map("n", "<leader>w", ":w<CR>", { desc = "保存文件" })
map("n", "<leader>q", ":q<CR>", { desc = "退出" })

--清除搜索高亮 (按下 Esc 后)
map("n", "<Esc>", ":nohlsearch<CR>")

-- 窗口导航 (使用 Ctrl + hjkl)
map("n", "<C-h>", "<C-w>h", { desc = "左窗口" })
map("n", "<C-j>", "<C-w>j", { desc = "下窗口" })
map("n", "<C-k>", "<C-w>k", { desc = "上窗口" })
map("n", "<C-l>", "<C-w>l", { desc = "右窗口" })

-- 缩进调整 (可视模式下保持选中)
map("v", "<", "<gv")
map("v", ">", ">gv")

vim.keymap.set({"n", "v"}, "<M-=>", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "代码格式化" })

-- Buffer 切换 (Alt + h/l)
-- 注意：<M-..> 代表 Alt 键 (Meta key)
map("n", "<M-l>", ":bnext<CR>", { desc = "下一个 Buffer", silent = true })
map("n", "<M-h>", ":bprev<CR>", { desc = "上一个 Buffer", silent = true })

