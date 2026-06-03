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
vim.opt.rnu = true
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

--Markview
vim.cmd("set nowrap")

