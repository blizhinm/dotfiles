local wezterm = require("wezterm")
local module = {}

local background = {
	{
		source = {
			-- File = wezterm.config_dir .. "/wallpapers/wallpaper.png",
			-- File = wezterm.config_dir .. "/wallpapers/wallpaper1.jpg",
			-- File = wezterm.config_dir .. "/wallpapers/wallpaper3.jpg",
			-- File = wezterm.config_dir .. "/wallpapers/wallpaper4.jpg",
			-- File = wezterm.config_dir .. "/wallpapers/night-city-pixel-art-1.jpg",
			File = wezterm.config_dir .. "/wallpapers/back.gif",
			-- File = wezterm.config_dir .. "/wallpapers/back5.gif",
		},
		attachment = "Fixed",
		vertical_align = "Bottom",
		horizontal_align = "Center",
		opacity = 1,
		hsb = {
			brightness = 0.3,
		},
	},
}

function module.apply_to_config(config)
	config.font = wezterm.font("SauceCodePro Nerd Font Mono")
	config.font_size = 14
	config.line_height = 1.0
	config.foreground_text_hsb = {
		brightness = 1,
	}

	config.default_cursor_style = "BlinkingBlock"
	config.cursor_blink_ease_in = "Linear"
	config.cursor_blink_ease_out = "Linear"
  config.cursor_blink_rate = 800

	config.use_fancy_tab_bar = false
	config.window_frame = {
		active_titlebar_bg = "rgba(0, 0, 0, 0)",
		inactive_titlebar_bg = "rgba(0, 0, 0, 0)",
		font_size = 10,
	}

	config.enable_tab_bar = true
	config.show_new_tab_button_in_tab_bar = false
	config.show_tab_index_in_tab_bar = true
	config.tab_and_split_indices_are_zero_based = false
	config.tab_bar_at_bottom = false
	config.tab_max_width = 2
	config.window_decorations = "RESIZE"
	config.window_background_opacity = 1
	config.text_background_opacity = 1

	-- Dim inactive panes
	config.inactive_pane_hsb = {
		saturation = 1,
		brightness = 0.5,
	}

	config.window_padding = {
		left = 8,
		right = 8,
		top = 4,
		bottom = 4,
	}

	config.background = background

	config.colors = {
		-- foreground = "#7FA8A8",
		-- background = "#001015",
		-- cursor_bg = "#4afcd6",
		-- cursor_border = "#4afcd6",
		-- cursor_fg = "#031413",
		-- selection_bg = "#415555",
		-- selection_fg = "#5afad6",
		-- ansi = {
		--   "#012126",
		--   "#b2302d",
		--   "#00a941",
		--   "#5e8baa",
		--   "#449a86",
		--   "#00599d",
		--   "#5d7e19",
		--   "#7FA8A8",
		-- },
		-- brights = {
		--   "#36414D",
		--   "#ff4242",
		--   "#2aea5e",
		--   "#8ed4fd",
		--   "#61d5ba",
		--   "#1298ff",
		--   "#98d028",
		--   "#58fbd6",
		-- },
		tab_bar = {
			-- The color of the inactive tab bar edge/divider
			inactive_tab_edge = "rgba(0, 0, 0, 0)",

			-- The color of the strip that goes along the top of the window
			-- (does not apply when fancy tab bar is in use)
			background = "rgba(30, 30, 46, 0.5)",

			-- The active tab is the one that has focus in the window
			active_tab = {
				-- The color of the background area for the tab
				bg_color = "rgba(30, 30, 46, 0.5)", -- "#0b0022",
				-- The color of the text for the tab
				-- fg_color = "#d0d0d0",
				-- fg_color = "#b4befe",
				-- fg_color = "#f2cdcd",
				fg_color = "#c099ff",

				-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
				-- label shown for this tab.
				-- The default is "Normal"
				intensity = "Bold",

				-- Specify whether you want "None", "Single" or "Double" underline for
				-- label shown for this tab.
				-- The default is "None"
				underline = "None",

				-- Specify whether you want the text to be italic (true) or not (false)
				-- for this tab.  The default is false.
				italic = false,

				-- Specify whether you want the text to be rendered with strikethrough (true)
				-- or not for this tab.  The default is false.
				strikethrough = false,
			},

			-- Inactive tabs are the tabs that do not have focus
			inactive_tab = {
				bg_color = "rgba(30, 30, 46, 0.5)",
				fg_color = "#606060",
			},

			-- You can configure some alternate styling when the mouse pointer
			-- moves over inactive tabs
			inactive_tab_hover = {
				bg_color = "rgba(30, 30, 46, 0.5)",
				fg_color = "#a0a0a0",
				italic = true,
			},

			-- The new tab button that let you create new tabs
			new_tab = {
				bg_color = "rgba(27, 16, 50, 0)",
				fg_color = "#808080",
			},

			-- You can configure some alternate styling when the mouse pointer
			-- moves over the new tab button
			new_tab_hover = {
				bg_color = "rgba(27, 16, 50, 0)",
				fg_color = "#a0a0a0",
				italic = true,
			},
		},
	}

	-- config.color_scheme = "catppuccin-mocha"
	config.color_scheme = "Catppuccin Mocha"
	-- config.color_scheme = "Tokyo Night Moon"
end

module["background"] = background

return module
