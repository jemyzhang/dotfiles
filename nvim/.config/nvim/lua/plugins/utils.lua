-- ~/.config/nvim/lua/plugins/utils.lua
return {
    -- 文件模糊查找 (Telescope)
    {
        "nvim-telescope/telescope.nvim",
        branch = "master",
        --tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            -- 快捷键设置
            vim.keymap.set('n', '<M-f>', builtin.find_files, { desc = "查找文件" })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "全局搜索文字" })
            vim.keymap.set('n', '<M-b>', builtin.buffers, { desc = "查找 Buffer" })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "查找帮助" })
            vim.keymap.set('n', '<M-a>', builtin.grep_string, { desc = "搜索光标下单词" })
        end
    },
    -- 文件树 (Neo-tree)
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>e", ":Neotree toggle<CR>", desc = "打开/关闭文件树" }
        }
    },
    -- 底部状态栏 (Lualine)
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true, -- 使用默认配置
    }
}
