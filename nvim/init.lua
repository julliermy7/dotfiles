local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.clipboard = "unnamedplus"
-- Defina a barra de espaço como a sua tecla leader
vim.g.mapleader = ' '

-- Navegar entre buffers
vim.keymap.set('n', '[b', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ']b', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })

require("lazy").setup("plugins")


