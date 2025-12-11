local wezterm = require("wezterm")
local style = require("style")
local module = {}

function module.apply_to_config(config)
  -- wezterm.on("gui-startup", function(cmd)
  -- 	local _, _, window = wezterm.mux.spawn_window(cmd or {})
  -- 	window:gui_window():maximize()
  -- 	window:toggle_fullscreen()
  -- end)

  wezterm.on("toggle-tabbar", function(window)
    local overrides = window:get_config_overrides() or {}

    if overrides.enable_tab_bar == nil then
      overrides.enable_tab_bar = config.enable_tab_bar
    end

    overrides.enable_tab_bar = not overrides.enable_tab_bar

    window:set_config_overrides(overrides)
  end)

  wezterm.on("toggle-opacity", function(window)
    local overrides = window:get_config_overrides() or {}
    -- local bg_color = "rgba(30, 30, 46, 1)"
    local bg_color = "rgba(0, 19, 26, 1)"
    local transparent = "transparent"

    if overrides.window_background_opacity == nil then
      overrides.window_background_opacity = config.window_background_opacity
    end

    if overrides.colors == nil then
      overrides.colors = config.colors
    end

    if overrides.window_background_opacity == 1 then
      overrides.background = {}
      overrides.foreground_text_hsb = {
        brightness = 0.675,
      }
      overrides.window_background_opacity = 0.675
      overrides.text_background_opacity = 0.675

      overrides.colors.background = bg_color
      overrides.colors.tab_bar.background = bg_color
      overrides.colors.tab_bar.active_tab.bg_color = bg_color
      overrides.colors.tab_bar.inactive_tab.bg_color = bg_color
      overrides.colors.tab_bar.inactive_tab_hover.bg_color = bg_color
    else
      overrides.background = style.background
      overrides.foreground_text_hsb = {
        brightness = 1,
      }
      overrides.window_background_opacity = 1
      overrides.text_background_opacity = 1

      overrides.colors.tab_bar.background = transparent
      overrides.colors.tab_bar.active_tab.bg_color = transparent
      overrides.colors.tab_bar.inactive_tab.bg_color = transparent
      overrides.colors.tab_bar.inactive_tab_hover.bg_color = transparent
    end

    window:set_config_overrides(overrides)
  end)

  wezterm.on("decrease-bg-brightness", function(window)
    local overrides = window:get_config_overrides() or {}

    if overrides.background == nil then
      overrides.background = config.background
    end

    local inc = 0.025
    local min = 0 + inc
    local newval = overrides.background[1].hsb.brightness - inc

    if newval < min then
      newval = min
    end

    overrides.background[1].hsb.brightness = newval

    window:set_config_overrides(overrides)
  end)

  wezterm.on("increase-bg-brightness", function(window)
    local overrides = window:get_config_overrides() or {}

    if overrides.background == nil then
      overrides.background = config.background
    end

    local inc = 0.025
    local max = 1 - inc
    local newval = overrides.background[1].hsb.brightness + inc

    if newval > max then
      newval = max
    end

    overrides.background[1].hsb.brightness = newval

    window:set_config_overrides(overrides)
  end)
end

return module
