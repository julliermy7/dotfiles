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

-- Função para compilar e rodar Java
function RunJava()
  -- Pega o arquivo atual
  local file = vim.fn.expand("%")
  -- Pega o nome do arquivo sem extensão
  local classname = vim.fn.expand("%:r")
  -- Comando para compilar e rodar
  local cmd = "javac " .. file .. " && java " .. classname
  -- Executa no terminal integrado do Neovim
  vim.cmd("split | terminal " .. cmd)
end

-- Mapeamento de tecla (F5)
vim.api.nvim_set_keymap("n", "<F5>", ":lua RunJava()<CR>", { noremap = true, silent = true })

vim.opt.rtp:prepend(lazypath)
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
-- Defina a barra de espaço como a sua tecla leader
vim.g.mapleader = ' '

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Navegar entre buffers
vim.keymap.set('n', '[b', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ']b', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ']c', ':BufferLinePickClose<CR>', { noremap = true, silent = true })

require("lazy").setup("plugins")


