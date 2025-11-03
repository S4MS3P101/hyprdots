local vim = vim
local Plug = vim.fn['plug#']

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
Plug 'rose-pine/neovim'
Plug 'echasnovski/mini.indentscope'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'scottmckendry/cyberdream.nvim'
Plug 'rebelot/kanagawa.nvim'
vim.call('plug#end')

require('lualine').setup({
  options = { theme = 'ayu' }
})
require("nvim-treesitter").setup()
require('mini.indentscope').setup({
  draw = {
    delay = 50,
  },

  symbol = '│',

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
require("cyberdream").setup({
  transparent = true,
  italic_comments = true,
})

vim.cmd('silent! colorscheme cyberdream')
