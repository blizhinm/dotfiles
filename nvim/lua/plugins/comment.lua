return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring =
      require("ts_context_commentstring.integrations.comment_nvim")

    -- enable comment
    comment.setup({
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = ts_context_commentstring.create_pre_hook(),

      ---Enable keybindings
      ---NOTE: If given `false` then the plugin won't create any mappings
      mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
      },

      toggler = {
        ---Line-comment toggle keymap
        line = "<leader>cc",
        ---Block-comment toggle keymap
        block = "<leader>cC",
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment toggle keymap
        line = "<leader>cc",
        ---Block-comment toggle keymap
        block = "<leader>cC",
      },
      ---LHS of extra mappings
      extra = {
        ---Add comment on the line above
        above = "<leader>cO",
        ---Add comment on the line below
        below = "<leader>co",
        ---Add comment at the end of line
        eol = "<leader>cA",
      },
    })
  end,
}
