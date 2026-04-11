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
	tab_bar = {
		background = "#0b0022",

		active_tab = {
			bg_color = "#2b2042",
			fg_color = "#c0c0c0",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#1b1032",
			fg_color = "#808080",
		},
		inactive_tab_hover = {
			bg_color = "#3b3052",
			fg_color = "#909090",
			italic = true,
		},
		new_tab = {
			bg_color = "#1b1032",
			fg_color = "#808080",
		},
		new_tab_hover = {
			bg_color = "#3b3052",
			fg_color = "#909090",
			italic = true,
		},
	},
}

-- Appearance
config.window_decorations = "RESIZE"
config.window_background_image = bg_image_url
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Misc
config.max_fps = 180

-- Plugins
require("plugins.wez-tmux.plugin").apply_to_config(config, {
	tab_and_split_indices_are_zero_based = true,
})

--@type WeztermTabs
local wezterm_tabs = wezterm.plugin.require("https://github.com/yriveiro/wezterm-tabs")

wezterm_tabs.apply_to_config(config, {
	tabs = {
		tab_bar_at_bottom = true,
		tab_max_width = 32,
	},
	ui = {
		separators = {
			arrow_solid_left = "\u{e0b0}",
			arrow_solid_right = "\u{e0b2}",
			arrow_thin_left = "\u{e0b1}",
			arrow_thin_right = "\u{e0b3}",
		},
		icons = {
			-- Development Tools
			["debug"] = wezterm.nerdfonts.cod_debug_console,
			["cargo"] = wezterm.nerdfonts.dev_rust,
			["git"] = wezterm.nerdfonts.dev_git,
			["go"] = wezterm.nerdfonts.seti_go,
			["lua"] = wezterm.nerdfonts.seti_lua,
			["node"] = wezterm.nerdfonts.md_hexagon,

			-- Shells and Terminals
			["bash"] = wezterm.nerdfonts.cod_terminal_bash,
			["zsh"] = wezterm.nerdfonts.dev_terminal,

			-- Text Editors
			["nvim"] = wezterm.nerdfonts.custom_vim,
			["vim"] = wezterm.nerdfonts.dev_vim,

			-- Container and Cloud Tools
			["docker"] = wezterm.nerdfonts.linux_docker,
			["docker-compose"] = wezterm.nerdfonts.linux_docker,
			["kubectl"] = wezterm.nerdfonts.linux_docker,

			-- Utilities
			["curl"] = wezterm.nerdfonts.md_waves,
			["gh"] = wezterm.nerdfonts.dev_github_badge,
			["make"] = wezterm.nerdfonts.seti_makefile,
			["sudo"] = wezterm.nerdfonts.fa_hashtag,
			["wget"] = wezterm.nerdfonts.md_arrow_down_box,
			["lazygit"] = wezterm.nerdfonts.dev_github_alt,
		},
	},
})

return config
