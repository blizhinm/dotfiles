return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    vim.env.ESLINT_D_PPID = vim.fn.getpid()

    -- ESLINT_D_ROOT=*local node_modules folder* nvim .
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
          lint.try_lint(
            nil,
            { cwd = os.getenv("ESLINT_D_ROOT") and "./frontend" or "." }
          )
        end,
      }
    )

    vim.keymap.set("n", "<leader>l", function()
      -- lint.try_lint()
      lint.try_lint(nil, { cwd = os.getenv("ESLINT_D_ROOT") and "./frontend" or "." })
    end, { desc = "Trigger linting for current file" })

    -- Set pylint to work in virtualenv
    require("lint").linters.pylint.cmd = "python"
    require("lint").linters.pylint.args = { "-m", "pylint", "-f", "json" }
  end,
}
