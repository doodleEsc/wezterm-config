local wezterm = require('wezterm')
local platform = require('utils.platform')

local font_family = 'Maple Mono Normal NL NF CN'
local font_fallback = 'Maple Mono Normal NL NF CN'
local font_size = platform.is_mac and 17 or 14

return {
   font = wezterm.font_with_fallback({ font_family, font_fallback }),
   font_size = font_size,

   ----ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
   --freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
   --freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
