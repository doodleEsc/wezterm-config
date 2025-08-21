local wezterm = require('wezterm')
local secrets = require('utils.secrets')

-- 插件配置管理
local plugins = {}

-- 创建示例密钥文件（如果不存在）
secrets.create_secrets_example()

-- 已安装的插件列表
plugins.installed = {
   -- 示例插件配置
   -- {
   --    url = 'https://github.com/Michal1993r/ai-helper.wezterm.git',
   --    name = 'ai-helper',
   --    config = function()
   --       -- 从密钥文件加载 API 密钥
   --       local secret_data = secrets.load_secrets()
   --       local api_key = secret_data.openai_api_key
   --       local api_url = secret_data.openai_api_url or 'https://api.openai.com/v1/chat/completions'
   --       local model = secret_data.openai_model or 'gpt-4o-mini'
   --
   --       return {
   --          type = 'http',
   --          api_url = api_url,
   --          api_key = api_key, -- if required
   --          model = model, -- model name
   --          headers = { -- optional custom headers
   --             ['X-Title'] = 'ai-helper.wezterm',
   --          },
   --       }
   --    end,
   -- },
}

-- 初始化插件系统
function plugins.setup(config)
   -- 确保插件目录存在
   local plugin_dir = wezterm.home_dir .. '/.config/wezterm/plugins'

   -- 加载已安装的插件
   for _, plugin_info in ipairs(plugins.installed) do
      local ok, plugin = pcall(function()
         return wezterm.plugin.require(plugin_info.url)
      end)

      if ok and plugin then
         -- 应用插件配置
         if plugin.apply_to_config then
            local plugin_config = plugin_info.config
            -- 如果config是函数，则调用它获取配置表
            if type(plugin_config) == 'function' then
               plugin_config = plugin_config()
            end

            if plugin_config then
               plugin.apply_to_config(config, plugin_config)
            else
               plugin.apply_to_config(config)
            end
         end
      else
         wezterm.log_warn('Failed to load plugin: ' .. plugin_info.name)
      end
   end
end

return plugins
