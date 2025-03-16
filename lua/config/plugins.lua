local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git", "clone", "--depth", "1",
      "https://github.com/wbthomason/packer.nvim", install_path
    })
    vim.cmd("packadd packer.nvim")
  end
end

ensure_packer()

return require("packer").startup(function(use)
  -- Менеджер плагинов
  use "wbthomason/packer.nvim"

  -- LSP (языковые сервера)
  use "neovim/nvim-lspconfig"

  -- Автодополнение
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "L3MON4D3/LuaSnip"

  -- Подсветка синтаксиса (без компиляции)
  use "sheerun/vim-polyglot"

  -- Файловый менеджер (удобная навигация)
  use {
    "nvim-tree/nvim-tree.lua",
    requires = "nvim-tree/nvim-web-devicons"
  }
end)
