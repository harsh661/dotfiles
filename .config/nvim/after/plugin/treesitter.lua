require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "lua", "vim", "typescript", "query" },

  sync_install = false,

  auto_install = true,

  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
  },

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
