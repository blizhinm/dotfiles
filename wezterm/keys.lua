local wezterm = require("wezterm")
local action = wezterm.action
local module = {}

function module.apply_to_config(config)
  config.leader = {
    key = "Space",
    mods = "CTRL|SHIFT",
    timeout_milliseconds = 1000,
  }

  config.keys = {
    {
      key = "v",
      mods = "CTRL",
      action = action.PasteFrom("Clipboard"),
    },
    { key = "UpArrow", mods = "SHIFT", action = action.ScrollByLine(-1) },
    { key = "DownArrow", mods = "SHIFT", action = action.ScrollByLine(1) },
    {
      key = "w",
      mods = "SHIFT|CTRL",
      action = action.CloseCurrentTab({
        confirm = false,
      }),
    },
    {
      key = "F11",
      action = action.ToggleFullScreen,
    },
    {
      key = "h",
      mods = "LEADER",
      action = action.SplitVertical({
        domain = "CurrentPaneDomain",
      }),
    },
    {
      key = "v",
      mods = "LEADER",
      action = action.SplitHorizontal({
        domain = "CurrentPaneDomain",
      }),
    },
    {
      key = "r",
      mods = "LEADER",
      action = action.RotatePanes("Clockwise"),
    },
    {
      key = "h",
      mods = "CTRL|ALT",
      action = action.ActivatePaneDirection("Left"),
    },
    {
      key = "l",
      mods = "CTRL|ALT",
      action = action.ActivatePaneDirection("Right"),
    },
    {
      key = "k",
      mods = "CTRL|ALT",
      action = action.ActivatePaneDirection("Up"),
    },
    {
      key = "j",
      mods = "CTRL|ALT",
      action = action.ActivatePaneDirection("Down"),
    },
  }

  -- config.key_tables = {
  -- 	panes = {
  -- 		{ key = "h", action = action.SplitVertical { domain = "CurrentPaneDomain" } },
  -- 		{ key = "v", action = action.SplitHorizontal { domain = "CurrentPaneDomain" } },

  --      { key = 'LeftArrow', action = action.AdjustPaneSize { 'Left', 1 } },
  -- 		{ key = 'RightArrow', action = action.AdjustPaneSize { 'Right', 1 } },
  -- 		{ key = 'UpArrow', action = action.AdjustPaneSize { 'Up', 1 } },
  -- 		{ key = 'DownArrow', action = action.AdjustPaneSize { 'Down', 1 } },

  -- 		-- Cancel the mode by pressing escape
  -- 		{ key = "Escape", action = "PopKeyTable" },
  -- 	},
  -- }
end

return module
