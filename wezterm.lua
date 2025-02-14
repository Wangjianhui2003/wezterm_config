-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- configuration
-- font
config.font = wezterm.font("JetBrainsMonoNL NF", { weight = "Regular", italic = false })
config.font_size = 10

-- Slightly transparent and blurred background
-- config.window_background_opacity = 0.9

-- Pick a colour scheme. WezTerm ships with more than 1,000!
-- Find them here: https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = "Tokyo Night"

-- Removes the title bar, leaving only the tab bar. Keeps
-- the ability to resize by dragging the window's edges.
-- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice if
-- you want to keep the window controls visible and integrate
-- them into the tab bar.
config.window_decorations = "RESIZE"

-- Sets the font for the window frame (tab bar)
config.window_frame = {
	-- Berkeley Mono for me again, though an idea could be to try a
	-- serif font here instead of monospace for a nicer look?
	font = wezterm.font({ family = "JetBrainsMonoNL NF", weight = "Regular" }),
	font_size = 9,
}

-- padding
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
-- change default shell
config.default_prog = { "pwsh.exe" }

-- window_frame
config.initial_cols = 160
config.initial_rows = 40

-- full screen
config.keys = {
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- re-pos
wezterm.on("window-config-reloaded", function(window, pane)
	window:set_position(150, 20)
end)

-- opacity
-- config.window_background_opacity = 0.9

-- and finally, return the configuration to wezterm
return config
