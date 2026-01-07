local wezterm = require("wezterm")
local style = require("style")
local module = {}

local opacity_transparent = 0.65
local opacity_opaque = 1
local opacity_placeholder = opacity_transparent
local opacity_bg_placeholder = opacity_opaque
local is_bg = true

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

    if is_bg then
      overrides.background = {}
      overrides.foreground_text_hsb = {
        brightness = opacity_transparent,
      }
      overrides.window_background_opacity = opacity_placeholder
      overrides.text_background_opacity = opacity_placeholder

      overrides.colors.background = bg_color
      overrides.colors.tab_bar.background = bg_color
      overrides.colors.tab_bar.active_tab.bg_color = bg_color
      overrides.colors.tab_bar.inactive_tab.bg_color = bg_color
      overrides.colors.tab_bar.inactive_tab_hover.bg_color = bg_color

      is_bg = false
    else
      overrides.background = style.background
      overrides.foreground_text_hsb = {
        brightness = opacity_opaque,
      }
      overrides.window_background_opacity = opacity_bg_placeholder
      overrides.text_background_opacity = opacity_bg_placeholder

      overrides.colors.tab_bar.background = transparent
      overrides.colors.tab_bar.active_tab.bg_color = transparent
      overrides.colors.tab_bar.inactive_tab.bg_color = transparent
      overrides.colors.tab_bar.inactive_tab_hover.bg_color = transparent

      is_bg = true
    end

    window:set_config_overrides(overrides)
  end)

  wezterm.on("decrease-bg-brightness", function(window)
    local overrides = window:get_config_overrides() or {}

    if overrides.background == nil then
      overrides.background = config.background
    end

    if overrides.window_background_opacity == nil then
      overrides.window_background_opacity = config.window_background_opacity
    end

    if overrides.background[1] then
      local incbg = 0.025
      local minbg = 0 + incbg
      local newvalbg = overrides.background[1].hsb.brightness - incbg

      if newvalbg < minbg then
        newvalbg = minbg
      end

      overrides.background[1].hsb.brightness = newvalbg
      opacity_bg_placeholder = newvalbg
    else
      local inc = 0.05
      local max = opacity_opaque
      local newval = overrides.window_background_opacity + inc

      if newval > max then
        newval = max
      end

      overrides.window_background_opacity = newval
      opacity_placeholder = newval
    end

    window:set_config_overrides(overrides)
  end)

  wezterm.on("increase-bg-brightness", function(window)
    local overrides = window:get_config_overrides() or {}

    if overrides.background == nil then
      overrides.background = config.background
    end

    if overrides.window_background_opacity == nil then
      overrides.window_background_opacity = config.window_background_opacity
    end

    if overrides.background[1] then
      local incbg = 0.025
      local maxbg = opacity_opaque - incbg
      local newvalbg = overrides.background[1].hsb.brightness + incbg

      if newvalbg > maxbg then
        newvalbg = maxbg
      end

      overrides.background[1].hsb.brightness = newvalbg
      opacity_bg_placeholder = newvalbg
    else
      local inc = 0.05
      local min = 0 + inc
      local newval = overrides.window_background_opacity - inc

      if newval < min then
        newval = min
      end

      overrides.window_background_opacity = newval
      opacity_placeholder = newval
    end

    window:set_config_overrides(overrides)
  end)
end

return module
