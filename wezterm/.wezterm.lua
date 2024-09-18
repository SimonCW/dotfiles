local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Catppuccin Mocha" -- Latte, Frappé, Macchiato, Mocha
config.font_size = 16
config.font = wezterm.font({
	family = "JetBrains Mono",
	weight = "DemiBold",
})
config.native_macos_fullscreen_mode = true
config.pane_focus_follows_mouse = true
-- Necessary for my Moonlander Layout to work.
config.send_composed_key_when_left_alt_is_pressed = true

return config
