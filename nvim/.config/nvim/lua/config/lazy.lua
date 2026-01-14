-- ~/.config/nvim/lua/config/lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 这里告诉 lazy 加载 lua/plugins 目录下的所有文件
require("lazy").setup("plugins", {
    change_detection = {
        notify = false, -- 关闭配置文件修改时的自动通知
    },
})
