return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    cmd = "Neotree",
    keys = {
      { "<leader>e", ":Neotree toggle<CR>", desc = "Toggle Neo-tree" },
    },
    config = function()
      require("neo-tree").setup({
        event_handlers = {
          {
            event = "file_open_requested",
            handler = function()
              -- auto close
              vim.cmd("Neotree close")
            end
          },
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰜌",
          provider = function(icon, node, state)
            if node.type == "file" or node.type == "terminal" then
              local success, web_devicons = pcall(require, "nvim-web-devicons")
              local name = node.type == "terminal" and "terminal" or node.name
              if success then
                local devicon, hl = web_devicons.get_icon(name)
                icon.text = devicon or icon.text
                icon.highlight = hl or icon.highlight
              end
            end
          end,
          default = "*",
          highlight = "NeoTreeFileIcon",
          use_filtered_colors = true,
        },
      })
    end,
  }
}
