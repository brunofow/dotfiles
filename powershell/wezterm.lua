local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.wsl_domains = {}

config.default_prog = { "pwsh.exe", "-NoLogo" }

config.font_size = 10
config.color_scheme = "JetBrains Mono"

function dynamic_background()
	local hour = tonumber(os.date("%H"))

	local day = {
		source = {
			File = "C:\\Users\\01702313\\AppData\\Local\\powershell\\images\\2-apartment.png",
		},
		hsb = {
			brightness = 0.3,
			saturation = 0.6,
		},
	}

	local night = {
		source = {
			File = "C:\\Users\\01702313\\AppData\\Local\\powershell\\images\\glowing-city.jpg",
		},
		hsb = {
			brightness = 0.3,
			saturation = 0.6,
		},
	}

	if hour >= 7 and hour < 18 then
		return day
	else
		return night
	end
end

config.background = { dynamic_background() }

return config
