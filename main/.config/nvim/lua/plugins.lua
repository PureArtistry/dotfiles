local fn = vim.fn

local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    vim.cmd [[packadd packer.nvim]]
end

local good, packer = pcall(require, 'packer')
if not good then error() end

packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'single' })
        end
    }
}

return packer.startup({
    function(use)
        use 'wbthomason/packer.nvim'
        -- Ubiquitous libs
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'kyazdani42/nvim-web-devicons'
        -- Temporary plugins (bugfixes, etc.)
        use 'antoinemadec/FixCursorHold.nvim'
        -- LSP and highlighting
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use 'neovim/nvim-lspconfig'
        -- Completion and snippets
        use { 'hrsh7th/nvim-cmp', requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-document-symbol',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lua',
            'ray-x/cmp-treesitter',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
            'lukas-reineke/cmp-rg',
            'f3fora/cmp-spell'
        }}
        use { 'saecki/crates.nvim',
            opt = true,
            event = { 'BufRead Cargo.toml' },
            config = function()
                require('crates').setup()
            end,
        }
        -- Handy shit
        use 'folke/which-key.nvim'
        use 'windwp/nvim-autopairs'
        use 'numToStr/Comment.nvim'
        use 'blackCauldron7/surround.nvim'
        use 'lukas-reineke/indent-blankline.nvim'
        use 'lewis6991/gitsigns.nvim'
        use 'iamcco/markdown-preview.nvim'
        -- Navigation
        use { 'nvim-telescope/telescope.nvim',
            opt = true,
            cmd = { 'Telescope' },
            config = function() require('finder') end
        }
        use { 'kyazdani42/nvim-tree.lua',
            opt = true,
            cmd = {
                'NvimTreeToggle',
                'NvimTreeOpen',
                'NvimTreeRefresh',
                'NvimTreeFindFile',
                'NvimTreeFindFileToggle',
                'NvimTreeFocus'
            },
            config = function() require('nvimtree') end
        }
        -- UI
        use 'akinsho/bufferline.nvim'
        use 'glepnir/galaxyline.nvim'
        use 'rcarriga/nvim-notify'
        use 'goolord/alpha-nvim'

        if PACKER_BOOTSTRAP then require('packer').sync() end
    end
})
