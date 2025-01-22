return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem.filtered_items = {
        visible = true, -- Mostra itens ocultos na árvore
        hide_gitignored = false, -- Mostra arquivos ignorados pelo Git
        hide_dotfiles = false, -- Mostra arquivos ocultos (dotfiles)
        hide_hidden = false, -- Mostra arquivos marcados como ocultos no Neo-tree
      }
      return opts
    end,
  }
}
