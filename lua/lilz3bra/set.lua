vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.updatetime = 50
vim.opt.smartindent = true
vim.opt.tabstop = 4 
vim.opt.softtabstop = 4 
vim.opt.shiftwidth = 4 
vim.opt.expandtab = true 

vim.opt.signcolumn = "yes"
vim.g.clipboard = {
  name = 'win32yank-wsl',
  copy = {
    ['+'] = 'win32yank.exe -i --crlf',
    ['*'] = 'win32yank.exe -i --crlf',
  },
  paste = {
    ['+'] = 'win32yank.exe -o --lf',
    ['*'] = 'win32yank.exe -o --lf',
  },
  cache_enabled = 0,
}
