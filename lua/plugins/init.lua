return { -- All plugins that we want
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {"nvim-treesitter/nvim-treesitter", build= ":TSUpdate"},
    { "nvim-lua/plenary.nvim" },
    { "windwp/nvim-ts-autotag" },
    { "theprimeagen/harpoon" }, 
}   
