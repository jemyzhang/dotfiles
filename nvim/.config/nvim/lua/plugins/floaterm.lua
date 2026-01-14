-- lua/plugins/floaterm.lua
return {
  "voldikss/vim-floaterm",
  -- 设置懒加载触发命令，或者你也可以用 keys 来触发
  cmd = { "FloatermNew", "FloatermToggle", "FloatermPrev", "FloatermNext" },
  keys = {
    -- 这里定义触发插件加载的按键，Lazy 会在按下这些键时加载插件
    { "<M-+>", "<cmd>FloatermNew<cr>", desc = "新建浮动终端" },
    { "<M-=>", "<cmd>FloatermToggle<cr>", desc = "切换浮动终端" },
    -- 终端模式下的映射 (t mode)
    { "<M-+>", "<c-\\><c-n>:FloatermNew<cr>", mode = "t", silent = true },
    { "<M-=>", "<c-\\><c-n>:FloatermToggle<cr>", mode = "t", silent = true },
  },
  config = function()
    -- 1. 配置全局变量 (替代 let g:...)
    vim.g.floaterm_position = 'center'
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.6
    vim.g.floaterm_rootmarkers = { '.project', '.git', '.hg', '.svn', '.root', '.gitignore' }
    -- vim.g.floaterm_autoinsert = false -- 如果需要取消注释

    -- 2. 设置自动命令 (替代 augroup)
    -- 当文件类型为 floaterm 时，设置 Buffer 级别的快捷键
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "floaterm",
      callback = function(event)
        -- 映射 <M-h> 为上一个终端 (Buffer 局部映射)
        vim.keymap.set("t", "<M-h>", [[<c-\><c-n>:FloatermPrev<CR>]], {
          buffer = event.buf,
          silent = true
        })
        -- 映射 <M-l> 为下一个终端 (Buffer 局部映射)
        vim.keymap.set("t", "<M-l>", [[<c-\><c-n>:FloatermNext<CR>]], {
          buffer = event.buf,
          silent = true
        })
      end,
    })
  end
}
