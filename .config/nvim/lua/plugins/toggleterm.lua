return {
  {
    "akinsho/toggleterm.nvim",
    version = "*", -- Use a versão mais recente
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<C-\>]], -- Atalho para abrir/fechar o terminal
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        persist_size = true,
        direction = "horizontal", -- "horizontal", "vertical", "tab" ou "float"
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 3,
        },
      })
    end,
  },
}
