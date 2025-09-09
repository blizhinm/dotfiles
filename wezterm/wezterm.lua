-- Pull in the wezterm API
local wezterm = require("wezterm")
local keys = require("keys")
local style = require("style")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.front_end = "OpenGL"
config.max_fps = 60
config.animation_fps = 15

-- config.wsl_domains = {
--   {
--     -- The name of this specific domain.  Must be unique amonst all types
--     -- of domain in the configuration file.
--     name = "WSL:Ubuntu-22.04",
--
--     -- The name of the distribution.  This identifies the WSL distribution.
--     -- It must match a valid distribution from your `wsl -l -v` output in
--     -- order for the domain to be useful.
--     distribution = "Ubuntu-22.04",
--
--     -- 'default_cwd' for domain
--     default_cwd = "~",
--   },
-- }
-- config.default_domain = "WSL:Ubuntu-22.04"

config.window_close_confirmation = "NeverPrompt"
config.skip_close_confirmation_for_processes_named =
  { "bash", "sh", "zsh", "fish", "tmux" }

-- applying config modules
keys.apply_to_config(config)
style.apply_to_config(config)

-- wezterm.on("gui-startup", function(cmd)
-- 	local _, _, window = wezterm.mux.spawn_window(cmd or {})
-- 	window:gui_window():maximize()
-- 	window:toggle_fullscreen()
-- end)

wezterm.on("toggle-opacity", function(window)
  local overrides = window:get_config_overrides() or {}

  if overrides.window_background_opacity == nil then
    overrides.window_background_opacity = 1
  end

  if overrides.window_background_opacity == 1 then
    overrides.background = {}
    overrides.foreground_text_hsb = {
      brightness = 0.5,
    }
    overrides.window_background_opacity = 0.5
    overrides.text_background_opacity = 0.66
  else
    overrides.background = style.background
    overrides.foreground_text_hsb = {
      brightness = 1,
    }
    overrides.window_background_opacity = 1
    overrides.text_background_opacity = 1
  end

  window:set_config_overrides(overrides)
end)

-- and finally, return the configuration to wezterm
return config
