" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

lua << EOF
    require'nvim-treesitter.configs'.setup {
        ensure_installed = {'bash', 'c', 'cmake', 'cpp', 'json', 'make', 'yaml'},

        highlight = {
            enable = true,
            disable = {},
            custom_captures = {
                -- ["foo.bar"] = "Identifier"
            },
        },

        refactor = {
          navigation = {
            enable = false,
            -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
            keymaps = {
              goto_definition = "gnd",
              list_definitions = "gnD",
              list_definitions_toc = "gO",
              goto_next_usage = "<a-*>",
              goto_previous_usage = "<a-#>",
            },
          },
          smart_rename = {
            enable = true,
            -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
            keymaps = {
              smart_rename = "grr",
            },
          },
          highlight_definitions = {
            -- cause high cpu usage on large file
            enable = false,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = false,
          },
          highlight_current_scope = { enable = false },
        },

        incremental_selection = {
            enable = true,
            disable = {},
            keymaps = {                       -- mappings for incremental selection (visual mappings)
                init_selection = 'gnn',         -- maps in normal mode to init the node/scope selection
                node_incremental = "grn",       -- increment to the upper named parent
                scope_incremental = "grc",      -- increment to the upper scope (as defined in locals.scm)
                node_decremental = "grm",       -- decrement to the previous node
            }
        },

        -- indent
        indent = {
            enable = false
        }
    }
EOF

