-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Garantir que as aspas e outros caracteres não sejam ocultados
vim.opt.conceallevel = 0
vim.opt.concealcursor = 'n'  -- Evita esconder no modo normal

vim.opt.relativenumber = false -- Desativa números relativos
vim.opt.number = true -- Mostra apenas os números das linhas
vim.opt.mouse = "a" -- Ativa o mouse em todos os modos

-- Mapeamentos para atalhos "tradicionais"
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Ctrl+S para salvar
map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<Esc>:w<CR>a", opts)

-- Ctrl+C e Ctrl+V
map("v", "<C-c>", '"+y', opts) -- Copiar
map("v", "<C-x>", '"+d', opts) -- Recortar
map("n", "<C-v>", '"+p', opts) -- Colar no modo normal
map("i", "<C-v>", '<Esc>"+pa', opts) -- Colar no modo insert

-- Ctrl+Z e Ctrl+Shift+Z (desfazer e refazer)
map("n", "<C-z>", "u", opts)
map("n", "<C-S-z>", "<C-r>", opts)

-- Ctrl+Z no modo Insert para desfazer
vim.api.nvim_set_keymap("i", "<C-z>", "<C-o>u", { noremap = true, silent = true })

-- Seleção com Shift + Setas
map("n", "<S-Left>", "v<Left>", opts)
map("n", "<S-Right>", "v<Right>", opts)
map("n", "<S-Up>", "v<Up>", opts)
map("n", "<S-Down>", "v<Down>", opts)

-- Ctrl+A para selecionar tudo
-- map("n", "<C-a>", "ggVG", opts)
-- Ctrl+A no modo Insert para selecionar tudo
vim.api.nvim_set_keymap("i", "<C-a>", "<Esc>ggVG", { noremap = true, silent = true })

-- Expandir e reduzir seleção (Ctrl+Shift+Setas)
vim.api.nvim_set_keymap("v", "<C-S-Left>", "v<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-S-Right>", "v<Right>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-S-Up>", "v<Up>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-S-Down>", "v<Down>", { noremap = true, silent = true })

-- Substituir texto (Ctrl+R)
vim.api.nvim_set_keymap("n", "<C-r>", ":%s/", { noremap = true })

-- Navegar entre resultados de busca (Ctrl+F e Ctrl+Shift+F)
vim.api.nvim_set_keymap("n", "<C-f>", "n", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-f>", "N", { noremap = true, silent = true })

-- Dividir a janela (Ctrl+N para nova janela horizontal e Ctrl+Shift+N para vertical)
vim.api.nvim_set_keymap("n", "<C-n>", ":vsplit<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-S-n>", ":vsplit<CR>", { noremap = true, silent = true })

-- Navegar entre janelas (Alt + Setas)
vim.api.nvim_set_keymap("n", "<A-Left>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-Right>", "<C-w>l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-Up>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-Down>", "<C-w>j", { noremap = true, silent = true })

-- Navegar entre buffers (Ctrl+Tab e Ctrl+Shift+Tab)
vim.api.nvim_set_keymap("n", "<C-Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })

-- Ir para o início e fim do arquivo (Ctrl+Home e Ctrl+End)
vim.api.nvim_set_keymap("n", "<C-Home>", "gg", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-End>", "G", { noremap = true, silent = true })

-- Abrir um arquivo (Ctrl+O)
vim.api.nvim_set_keymap("n", "<C-o>", ":edit ", { noremap = true })

-- Fechar um arquivo (Ctrl+W)
vim.api.nvim_set_keymap("n", "<C-w>", ":q<CR>", { noremap = true, silent = true })

-- Salvar e sair (Ctrl+Shift+S)
vim.api.nvim_set_keymap("n", "<C-S-s>", ":wq<CR>", { noremap = true, silent = true })

-- Alternar buffers com Ctrl+1, Ctrl+2, etc., ignorando buffers auxiliares
for i = 1, 9 do
    vim.api.nvim_set_keymap('n', '<C-' .. i .. '>', ":lua SwitchToBuffer(" .. i .. ")<CR>", { noremap = true, silent = true })
end

-- Função para alternar buffers reais
function SwitchToBuffer(index)
    local buffers = vim.fn.getbufinfo({ buflisted = true }) -- Obtém apenas buffers listados
    if index <= #buffers then
        vim.cmd("buffer " .. buffers[index].bufnr) -- Troca para o buffer correspondente
    else
        print("Buffer " .. index .. " não encontrado!")
    end
end
