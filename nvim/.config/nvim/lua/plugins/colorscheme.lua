-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
    {
        "folke/tokyonight.nvim",
        lazy = false, -- 启动时加载
        priority = 1000, -- 确保最先加载
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
    }
}
