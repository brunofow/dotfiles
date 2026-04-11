local wezterm = require("wezterm")
local config = wezterm.config_builder()

local bg_image_url = os.getenv("LOCALAPPDATA") .. "/powershell/images/bg-blurred-darker.png"

-- Disable the default WSL domain to prevent automatic spawning of WSL shells
config.wsl_domains = {}

-- Default shell to PowerShell 7
config.default_prog = { "pwsh.exe", "-NoLogo" }

-- Font settings
config.font_size = 11
config.font = wezterm.font("JetBrains Mono")

-- Colors
config.colors = {
	cursor_bg = "#c5c5c5",
	cursor_border = "#c5c5c5",
}

-- Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_image = bg_image_url
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.max_fps = 180
-- Misc

return config
