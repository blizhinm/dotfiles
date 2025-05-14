return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
        border = "rounded",
        backdrop = 50,
        width = 0.6,
        height = 0.8,
			},
		})

		mason_lspconfig.setup({
      automatic_enable = true,
			automatic_installation = true,
			ensure_installed = {
				"cssls",
				"docker_compose_language_service",
				"dockerls",
				"dotls",
				-- "eslint",
				"emmet_ls",
				"html",
				"jsonls",
				"lua_ls",
				"pyright",
				"ts_ls",
				"yamlls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- linters
				"eslint_d",
				"pylint",
				-- formatters
				"black",
				"isort",
				"prettierd",
				"prettier",
				"stylua",
			},
		})
	end,
}
