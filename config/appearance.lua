local gpu_adapters = require('utils.gpu_adapter')

return {
   animation_fps = 10,
   max_fps = 60,
   front_end = 'WebGpu',
   webgpu_power_preference = 'HighPerformance',
   webgpu_preferred_adapter = gpu_adapters:pick_best(),

   -- color scheme
   color_scheme = 'Gruvbox dark, medium (base16)',

   -- scrollbar
   enable_scroll_bar = false,
   hide_tab_bar_if_only_one_tab = true,

   -- window
   window_padding = {
      left = '0.5cell',
      right = '0.5cell',
      top = 0,
      bottom = 0,
   },
   adjust_window_size_when_changing_font_size = false,
   window_close_confirmation = 'NeverPrompt',
   window_frame = {
      active_titlebar_bg = '#090909',
   },
   inactive_pane_hsb = {
      saturation = 1,
      brightness = 1,
   },
   enable_wayland = false,
}
