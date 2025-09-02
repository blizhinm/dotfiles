return {
  "stevearc/conform.nvim",
  dependencies = {
    "LazyVim/LazyVim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        lua = { "stylua" },
        python = { "isort", "black" },
        fish = { "fish_indent" },
      },
      -- format_on_save = {
      -- 	lsp_fallback = true,
      -- 	async = false,
      -- 	timeout_ms = 1000,
      -- },
      -- formatters = {
      --   stylua = {
      --     prepend_args = { "--config-path", "/home/maxx/.config/nvim/.stylua.toml" },
      --   },
      -- },
    })

    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
    vim.keymap.set({ "n", "v" }, "<leader>ce", function()
      if vim.fn.exists("EslintFixAll") then
        vim.cmd("EslintFixAll")
      end
    end, { desc = "EslintFixAll" })
  end,
}
