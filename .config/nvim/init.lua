local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Completion framework
Plug 'hrsh7th/nvim-cmp'
-- LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
-- Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

-- Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

-- Icons
Plug 'nvim-tree/nvim-web-devicons'

-- Snippet engine
Plug 'hrsh7th/vim-vsnip'

-- Collection of common configurations for the Nvim LSP client
Plug ('neovim/nvim-lspconfig')

-- To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'mrcjkb/rustaceanvim'

-- A highly customizable theme for vim and neovim with support for lsp, treesitter and a variety of plugins.
Plug 'EdenEast/nightfox.nvim'

-- Fern (furn) is a general purpose asynchronous tree viewer written in pure Vim script.
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

-- nvim-dap is a Debug Adapter Protocol client implementation
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-lua/plenary.nvim'

-- Vim plugin for git
Plug 'tanvirtin/vgit.nvim'

-- Command-line fuzzy finder
Plug ('nvim-telescope/telescope-fzf-native.nvim', {['do'] = function()
    vim.call("cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release")
end
})

-- Highly extendable fuzzy finder over lists
Plug('nvim-telescope/telescope.nvim', {['tag'] = '0.1.8' })

-- Treesitter configurations and abstraction layer for Neovim.
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

vim.call('plug#end')
