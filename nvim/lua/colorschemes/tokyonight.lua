return {
	"folke/tokyonight.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		-- load the colorscheme here
		require("tokyonight").setup({
			style = "moon",
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			on_colors = function(colors)
				-- colors.bg_dark = colors.none
				-- colors.bg_float = colors.none
				colors.bg_sidebar = colors.none
				colors.bg_statusline = colors.none
			end,
			on_highlights = function(hl, c)
				hl.TabLineFill = {
					bg = c.none,
				}
        hl.FloatBoarder = { fg = c.fg_float }
			end,
		})

		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		-- vim.cmd("augroup user_colors\nautocmd!\nautocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE\naugroup END\ncolorscheme tokyonight")
		vim.cmd("colorscheme tokyonight")

		vim.cmd("highlight Pmenu guibg=NONE") -- window transparency
		vim.diagnostic.config({ float = { border = "rounded", scope = "line" } }) -- diagnostic boarder
	end,
}
