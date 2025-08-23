return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      python = { "pylint" },
    }

    vim.api.nvim_create_autocmd(
      { "BufEnter", "TextChanged" },
      { --  "BufEnter", "BufWritePost", "InsertLeave", "TextChanged"
        callback = function()
          lint.try_lint()
        end,
      }
    )

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })

    -- Set pylint to work in virtualenv
    require("lint").linters.pylint.cmd = "python"
    require("lint").linters.pylint.args = { "-m", "pylint", "-f", "json" }
  end,
}
