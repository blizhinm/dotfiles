local function focus(app)
  -- get screen where you are with your mouse
  -- local screen = hs.mouse.getCurrentScreen()
  -- get main window
  -- local win = app:mainWindow()

  -- win:setLevel(hs.drawing.windowLevels.floating)

  -- hs.timer.doAfter(0.2, function()
  -- app:unhide()
  app:activate(true)
  -- win:raise()
  -- win:focus()
  -- end)
  -- app_window:moveToScreen(screen)
end

local function bindHotkey(appName, key)
  hs.hotkey.bind({ "cmd", "alt" }, key, function()
    -- find app
    local app = hs.application.find(appName)
    -- if app is running
    if app then
      -- if app is on front
      if app:isFrontmost() then
        app:hide()
      else
        focus(app)
      end
    else
      -- launch app
      app = hs.application.open(appName, 2, true)
      focus(app)
    end
  end)
end

-- call binder with Full Qualified Name of WezTerm and Escape key
bindHotkey("com.github.wez.wezterm", "space")
