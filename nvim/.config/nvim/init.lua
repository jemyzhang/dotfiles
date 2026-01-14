-- ~/.config/nvim/init.lua

-- 加载基础配置
require("config.options")
require("config.keymaps")

-- 加载插件管理器 (会自动处理 plugins 目录)
require("config.lazy")
