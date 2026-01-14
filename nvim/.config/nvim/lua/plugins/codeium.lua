-- ~/.config/nvim/lua/plugins/codeium.lua
return {
    "Exafunction/codeium.vim",
    branch = "main",
    event = "BufEnter", -- 或者 "InsertEnter" 延迟加载
    config = function()
        -- 1. 禁用默认按键绑定 (通常默认是 Tab，如果你想用 <C-g> 最好关掉默认的)
        vim.g.codeium_disable_bindings = 1

        -- 2. 设置自定义按键 <C-g>
        vim.keymap.set("i", "<C-g>", function()
            return vim.fn["codeium#Accept"]()
        end, { expr = true, silent = true, nowait = true })

        -- 可选：如果你还需要 Cycle (切换建议) 的按键
        vim.keymap.set("i", "<C-;>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true, silent = true })
        vim.keymap.set("i", "<C-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true, silent = true })
        vim.keymap.set("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true, silent = true })
    end
}
