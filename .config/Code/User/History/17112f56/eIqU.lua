-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.relativenumber = false -- Desativa números relativos
vim.opt.number = true -- Mostra apenas os números das linhas
vim.opt.mouse = 'a' -- Ativa o mouse em todos os modos

-- Mapeamentos para atalhos "tradicionais"
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Ctrl+S para salvar
map('n', '<C-s>', ':w<CR>', opts)
map('i', '<C-s>', '<Esc>:w<CR>a', opts)

-- Ctrl+C e Ctrl+V
map('v', '<C-c>', '"+y', opts) -- Copiar
map('v', '<C-x>', '"+d', opts) -- Recortar
map('n', '<C-v>', '"+p', opts) -- Colar no modo normal
map('i', '<C-v>', '<Esc>"+pa', opts) -- Colar no modo insert

-- Ctrl+Z e Ctrl+Shift+Z (desfazer e refazer)
map('n', '<C-z>', 'u', opts)
map('n', '<C-S-z>', '<C-r>', opts)

-- Seleção com Shift + Setas
map('n', '<S-Left>', 'v<Left>', opts)
map('n', '<S-Right>', 'v<Right>', opts)
map('n', '<S-Up>', 'v<Up>', opts)
map('n', '<S-Down>', 'v<Down>', opts)

-- Ctrl+A para selecionar tudo
map('n', '<C-a>', 'ggVG', opts)
