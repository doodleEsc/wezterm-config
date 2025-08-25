local wezterm = require('wezterm')
local M = {}

-- 获取密钥文件路径
local function get_secrets_file_path()
   return wezterm.home_dir .. '/.config/wezterm/secrets.lua'
end

-- 获取示例密钥文件路径
local function get_secrets_example_file_path()
   return wezterm.home_dir .. '/.config/wezterm/secrets.example.lua'
end

-- 读取密钥文件
function M.load_secrets()
   local secrets_file = get_secrets_file_path()
   local ok, secrets = pcall(function()
      local file = loadfile(secrets_file)
      return file and file()
   end)

   if ok and secrets then
      return secrets
   else
      wezterm.log_warn('Failed to load secrets file, using empty table')
      return {}
   end
end

-- 创建示例密钥文件
function M.create_secrets_example()
   local example_file = get_secrets_example_file_path()

   -- 检查示例文件是否已存在
   local file = io.open(example_file, 'r')
   if file then
      file:close()
      return -- 文件已存在，不需要重新创建
   end

   -- 创建示例文件
   local content = [[
-- This is an example secrets file for WezTerm configuration
-- Copy this file to secrets.lua and fill in your actual secrets

return {
  -- OpenAI API key for ai-helper plugin
  openai_api_key = "your-openai-api-key-here",
  
  -- Add other secrets here as needed
  -- github_token = "your-github-token-here",
}
]]

   local file = io.open(example_file, 'w')
   if file then
      file:write(content)
      file:close()
      wezterm.log_info('Created secrets example file at: ' .. example_file)
   else
      wezterm.log_error('Failed to create secrets example file')
   end
end

return M

