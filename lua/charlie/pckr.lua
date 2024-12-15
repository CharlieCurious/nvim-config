local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
    -- color scheme
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        config = function()
            vim.cmd('colorscheme catppuccin')
        end
    },

    -- Telescope
    { 'nvim-lua/plenary.nvim' },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Harpoon
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    },

    -- Mason
    'williamboman/mason.nvim',
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' }
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'williamboman/mason-lspconfig.nvim' }
    },
    {
        'Hoffs/omnisharp-extended-lsp.nvim',
        dependencies = { 'neovim/nvim-lspconfig' }
    },

    -- Autocompletion
    'hrsh7th/cmp-nvim-lsp',
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
        }
    },

    -- NvimTree
    'nvim-tree/nvim-web-devicons',
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
    },

    -- Fugitive
    'tpope/vim-fugitive',

    -- Trouble
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- UndoTree
    'mbbill/undotree'
}
