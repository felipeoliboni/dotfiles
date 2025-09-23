vim.g.mapleader = " "
vim.g.maplocalleader = " "

require 'config'
require 'keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)


require('lazy').setup({
  { "nvim-tree/nvim-web-devicons", opts = {} },
  { "github/copilot.vim" },
  { "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate" },

  require 'plugins.snacks',
  require 'plugins.autopairs',
  require 'plugins.indent_line',
  require 'plugins.telescope',
  require 'colorscheme',
})
