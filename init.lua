require("jcraiglo")
require("config.lazy")


vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

--Theme
vim.opt.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

--Line numbers
vim.opt.number = true

--Spell check
vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

--Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files'})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

--Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set('n', '<leader>hx', mark.add_file, {desc = 'Harpoon mark file'}) 
vim.keymap.set('n', '<leader>hc', ui.toggle_quick_menu, {desc = 'Harpoon open quick menu'})
vim.keymap.set('n', '<leader>hg', ui.nav_next, {desc = 'Harpoon jump one file'})

--Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

--LSP
--vim.lsp.enable("basedpyright")

--Neo-Tree
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = "Toggle Neo-tree" })
require("neo-tree").setup({
  event_handlers = {
    {
      event = "file_open_requested",
      handler = function()
        -- auto close
        vim.cmd("Neotree close")
        -- OR
        -- require("neo-tree.command").execute({ action = "close" })
      end
    },
  icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "󰜌",
      provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
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
      -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
      -- then these will never be used.
      default = "*",
      highlight = "NeoTreeFileIcon",
      use_filtered_colors = true, -- Whether to use a different highlight when the file is filtered (hidden, dotfile, etc.).
    },
  }
})

--Markview
vim.cmd("set nowrap")

