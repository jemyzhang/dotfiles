-- ~/.config/nvim/lua/config/options.lua

local opt = vim.opt

-- 行号
opt.number = true
-- opt.relativenumber = true -- 相对行号

-- 缩进 (4个空格)
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 剪贴板 (与系统剪贴板互通)
opt.clipboard:append("unnamedplus")

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes" -- 总是显示左侧符号列 (防止抖动)
opt.cursorline = true  -- 高亮当前行

-- 分屏行为
opt.splitright = true
opt.splitbelow = true

-- 鼠标支持
opt.mouse = ""

opt.autoindent = true  -- 继承前一行的缩进
opt.smartindent = true -- 在C语言风格的代码块中更加智能
opt.breakindent = true -- 换行后的行保持视觉缩进

