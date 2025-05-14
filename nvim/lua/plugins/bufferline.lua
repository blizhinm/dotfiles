return {
  "akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			separator_style = { "", "" }, -- "thin",
			diagnostics = "nvim_lsp",
			themable = true,
			offsets = {
				{
					filetype = "NvimTree",
					text = "",
					separator = true,
				},
			},

      always_show_bufferline = false,
      auto_toggle_bufferline = true,
			enforce_regular_tabs = false,
			max_name_length = 40,
			tab_size = 20,
			indicator = {
				icon = "", -- this should be omitted if indicator style is not 'icon'
				style = "underline",
			},
			close_icon = "", -- 
			buffer_close_icon = "", -- 
		},
	},
}
