-- lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate", -- runs after install/update
  opts = {
      ensure_installed = {
        "lua", "javascript", "haskell", "python",
        "cpp", "asm", "typescript", "rust"
      },
      indent = { enable = true },
      highlight = {
        enable = true,
        -- Example: disable highlighting for big files
        -- disable = function(lang, buf)
        --   local max_filesize = 100 * 1024 -- 100 KB
        --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        --   if ok and stats and stats.size > max_filesize then
        --     return true
        --   end
        -- end,
      },
      auto_install = true,
      sync_install = false,
      additional_vim_regex_highlighting = false,
    }
}

