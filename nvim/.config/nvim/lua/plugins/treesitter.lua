-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "vim", "vimdoc", "c", "cpp", "python",
      "javascript", "bash", "markdown"
    },
    auto_install = true,
    highlight = {
      enable = true, -- 启用高亮
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  },
}
