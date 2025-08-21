local Config = require('config')

require('events.start-up').setup()

-- 插件系统初始化
local plugins = require('config.plugins')

local config_instance = Config:init()
   :append(require('config.appearance'))
   :append(require('config.bindings'))
   :append(require('config.fonts'))
   :append(require('config.general'))
   :append(require('config.launch'))

-- 加载插件
plugins.setup(config_instance.options)

return config_instance.options
