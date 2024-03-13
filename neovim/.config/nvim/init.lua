
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
lsp.marksman.setup{}

-- Enable LSP mappings when it's actually loaded
vim.keymap.set('i', '<C-Space>', '<C-x><C-o>')
vim.api.nvim_create_autocmd('LspAttach', {
  -- Run when _any_ LSP is running, connected and attached to a buffer 
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc' 
    -- Specific actions on current buffer
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end,
})

-- Fuzzy Finder to open files, etz
vim.cmd 'packadd fzf'
local fzf = require('fzf-lua')
vim.keymap.set('n', '<c-O>', fzf.files)
vim.keymap.set('n', '<c-K>', fzf.buffers)

-- Color-Scheme:
vim.cmd 'packadd edge'
vim.cmd 'colorscheme edge'
