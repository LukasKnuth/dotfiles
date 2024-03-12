
-- Setup Tree-Sitter for better Syntax Highlighting
vim.cmd 'packadd tree-sitter'
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "comment", 
    "c", "cpp", "cmake", "lua", "python", "regex", "rust",
    "git_config", "git_rebase", "gitcommit", "gitignore", "diff",
    "dockerfile", "bash", "hcl", "ini", "jsonc", "nix", "toml", "xml", "yaml",
    "css", "javascript", "html", "hurl", "json", "markdown", "sql", "typescript",
    "elixir", "erlang", "heex",
    "gdscript", 
  },
  highlight = {enable = true},
  -- TODO keybinds for this!
  incremental_selection = {enable = true},
}

-- Setup LSP for better intelli-sense suggestions
vim.cmd 'packadd lsp'
local lsp = require('lspconfig')
-- TODO should I set this up to only run on specific file opens?

-- Fuzzy Finder to open files, etz
vim.cmd 'packadd fzf'
local fzf = require('fzf-lua')
vim.keymap.set('n', '<c-O>', fzf.files)
vim.keymap.set('n', '<c-K>', fzf.buffers)

-- Color-Scheme:
vim.cmd 'packadd edge'
vim.cmd 'colorscheme edge'
