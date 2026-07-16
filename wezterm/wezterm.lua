local wezterm = require('wezterm')

local config = {
	font = wezterm.font('Source Code Pro'),
	font_size = 18.0,
	use_ime = true,
	color_scheme = 'pinky (base16)',
	window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
}

local background = '/usr/share/backgrounds/archlinux/small.png'
local f = io.open(background, 'r')
if f then
	f:close()
	config.window_background_image = background
	config.window_background_image_hsb = { brightness = 0.5, hue = 1.0, saturation = 1.0 }
end

return config
