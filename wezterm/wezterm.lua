local wezterm = require('wezterm')

local config = {
	font = wezterm.font('Source Code Pro'),
	font_size = 18.0,
	use_ime = true,
	color_scheme = 'pinky (base16)',
	window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
    window_background_image = '/usr/share/backgrounds/archlinux/small.png',
    window_background_image_hsb = { brightness =0.5, hue = 1.0, saturation = 1.0 }
}

return config
