local vim = vim
local Plug = vim.fn['plug#']

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.syntax = 'on'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 2
vim.opt.conceallevel = 2
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.shortmess:append 'F'
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.mouse = 'a'
vim.opt.background = 'dark'

vim.call('plug#begin')
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'echasnovski/mini.indentscope'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug ('nvim-telescope/telescope.nvim', { ['branch'] = '0.1.x' })
Plug 'rose-pine/neovim'
Plug 'rebelot/kanagawa.nvim'
Plug 'folke/tokyonight.nvim'
vim.call('plug#end')

require('lualine').setup({
  options = { theme = 'auto' },
  extensions = { "nvim-tree" },
})
require("nvim-treesitter").setup()
require('mini.indentscope').setup({
  draw = {
    delay = 50,
  },
  symbol = '│',
  indent_levels = 4,
  options = {
    border = 'both', 
    indent_at_cursor = true,
    try_as_border = true,
  },
})
require("ibl").setup({
  indent = {
    char = "│",
  },
  scope = { enabled = false },
})
require('kanagawa').setup({
    transparent = true,
    theme = "wave" 
})
require('rose-pine').setup({
styles = { transparency = true },
})
require("tokyonight").setup({
  transparent = true,
})
require("telescope").setup()
require("nvim-tree").setup({
update_focused_file = {
  enable = true,
  update_root = true,
},
sync_root_with_cwd = true,
respect_buf_cwd = true,
})
vim.cmd('silent! colorscheme rose-pine')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<space>fg', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<space>fb', builtin.buffers, { desc = "Find buffers" })
vim.keymap.set('n', '<space>fh', builtin.help_tags, { desc = "Find help" })
