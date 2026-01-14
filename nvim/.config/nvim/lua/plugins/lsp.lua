-- lua/plugins/lsp.lua
return {
    -- 1. Mason (下载器)
    { "williamboman/mason.nvim", config = true },

    -- 2. Mason-LSPConfig (配置桥接器 - 核心配置在这里)
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            mason_lspconfig.setup({
                ensure_installed = { "lua_ls" }, -- 确保安装 lua_ls
                handlers = {
                    -- 默认处理器
                    function(server_name)
                        vim.lsp.config(server_name, {
                            capabilities = capabilities,
                        })
                        vim.lsp.enable(server_name)
                    end,

                    -- Lua 专用配置 (移动到这里)
                    ["lua_ls"] = function()
                        vim.lsp.config("lua_ls", {
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    diagnostics = { globals = { "vim" } },
                                },
                            },
                        })
                        vim.lsp.enable("lua_ls")
                    end,
                }
            })
        end
    },

    -- 3. nvim-lspconfig (只负责设置全局快捷键)
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- LspAttach 自动命令：当任何 LSP 启动并附加到 buffer 时触发
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    -- 在这里设置快捷键
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                    -- 格式化快捷键
                    vim.keymap.set('n', '<leader>f', function() 
                        vim.lsp.buf.format({ async = true }) 
                    end, opts)
                end,
            })
        end
    },

    -- 4. nvim-cmp (自动补全 - 保持不变)
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                }),
                sources = cmp.config.sources({ { name = 'nvim-lsp' }, { name = 'luasnip' } })
            })
        end
    }
}
