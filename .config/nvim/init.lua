require'lspconfig'.pyright.setup{}
require'lspconfig'.ccls.setup{}

vim.g.mapleader = ','

vim.o.swapfile = false
vim.bo.swapfile = false
vim.o.backup = false
vim.o.writeback = false
vim.o.autoread = true

vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.softtabstop = 4
vim.bo.softtabstop = 4
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.smartindent = true
vim.bo.smartindent = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartab = true

vim.wo.relativenumber = true

vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.smartecase = true
vim.o.hlsearch = true

vim.o.lazyredraw = true

vim.o.mouse='a'

vim.o.completeopt = 'menuone,preview,noinsert'

vim.o.hidden = true

vim.o.clipboard = 'unnamedplus'

vim.api.nvim_command('highlight LineNr ctermfg=grey')

vim.o.ttyfast  =true