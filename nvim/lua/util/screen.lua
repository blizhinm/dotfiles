local screen_w = vim.opt.columns:get()
local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()

return {
  get_window_sizes_by_ratios = function(ratios)
    local window_w = screen_w * (ratios.w or 0.7)
    local window_h = screen_h * (ratios.h or 0.8)
    local center_x = (screen_w - window_w) / 2
    local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()

    return {
      width = math.floor(window_w),
      height = math.floor(window_h),
      row = center_y,
      col = center_x,
    }
  end,
}
