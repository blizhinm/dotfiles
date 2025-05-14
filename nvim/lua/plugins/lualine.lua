return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = "catppuccin",
        globalstatus = true,
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      -- winbar = {
      -- 	lualine_a = {
      -- 		{
      -- 			"filename",
      -- 			separator = { left = "", right = "" },
      -- 			color = { fg = "", bg = "", gui = "bold" },
      -- 		},
      -- 	},
      -- },
      -- inactive_winbar = {
      -- 	lualine_a = {
      -- 		{
      -- 			"filename",
      -- 			separator = { left = "", right = "" },
      -- 			color = { fg = "NvimDarkGray4", bg = "", gui = "italic" },
      -- 		},
      -- 	},
      -- },
      sections = {
        lualine_a = {
          function()
            local reg = vim.fn.reg_recording()
            -- If a macro is being recorded, show "Recording @<register>"
            if reg ~= "" then
              return "Recording @" .. reg
            else
              -- Get the full mode name using nvim_get_mode()
              local mode = vim.api.nvim_get_mode().mode
              local mode_map = {
                n = "NORMAL",
                i = "INSERT",
                v = "VISUAL",
                V = "V-LINE",
                ["^V"] = "V-BLOCK",
                c = "COMMAND",
                R = "REPLACE",
                s = "SELECT",
                S = "S-LINE",
                ["^S"] = "S-BLOCK",
                t = "TERMINAL",
              }

              -- Return the full mode name
              return mode_map[mode] or mode:upper()
            end
          end,
        },
        lualine_c = {
          {
            "filesize",
            separator = "",
            padding = { left = 1, right = 0 },
            color = { fg = "NvimLightGray4" },
          },
          {
            "filename",
            color = function()
              return { fg = vim.bo.modified and "NvimLightYellow" or "" }
            end,
            separator = "",
            file_status = true, -- Displays file status (readonly status, modified status)
            newfile_status = false, -- Display new file status (new file means no write after created)
            path = 3, -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path
            -- 3: Absolute path, with tilde as the home directory
            -- 4: Filename and parent dir, with tilde as the home directory

            shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            -- for other components. (terrible name, any suggestions?)
            symbols = {
              modified = "[+]", -- Text to show when the file is modified.
              readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
              unnamed = "[No Name]", -- Text to show for unnamed buffers.
              newfile = "[New]", -- Text to show for newly created file before first write
            },
          },
        },
        lualine_x = { "filetype" },
        lualine_y = {
          {
            "vim.api.nvim_buf_line_count(0)",
            fmt = function(str)
              return str .. " lines"
            end,
            separator = "",
          },
          {
            "selectioncount",
            padding = { left = 0, right = 1 },
            fmt = function(str)
              if str == nil or str == "" then
                return str
              else
                return "[" .. str .. "]"
              end
            end,
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
