-- lua/plugins/undotree.lua
return {
    "mbbill/undotree",
    keys = {
        { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "查看撤销历史" },
    },
    config = function()
        -- 设置焦点自动回到编辑器，而不是留在撤销树窗口
        vim.g.undotree_SetFocusWhenToggle = 1
    end
}
