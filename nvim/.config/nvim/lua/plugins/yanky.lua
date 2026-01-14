-- lua/plugins/yanky.lua
return {
    "gbprod/yanky.nvim",
    dependencies = {
        -- 既然你已经装了 telescope，这里加上它作为依赖
        "nvim-telescope/telescope.nvim",
    },
    keys = {
        -- 核心功能：粘贴时按 <Ctrl-n> / <Ctrl-p> 循环切换剪贴板历史
        { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
        { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
        { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" } },
        { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" } },
        { "<c-n>", "<Plug>(YankyCycleForward)", mode = "n" },
        { "<c-p>", "<Plug>(YankyCycleBackward)", mode = "n" },

        -- 强力功能：用 Telescope 搜索剪贴板历史
        { "<leader>fy", "<cmd>Telescope yank_history<cr>", desc = "搜索剪贴板历史" },
    },
    config = function()
        require("yanky").setup({
            ring = {
                history_length = 100, -- 记住最近 100 次复制
                storage = "shada",    -- 防止重启后丢失
            },
            highlight = {
                on_put = true,        -- 粘贴时高亮一下，很直观
                timer = 200,
            },
        })

        -- 让 Telescope 加载 yanky 扩展
        require("telescope").load_extension("yank_history")
    end,
}
