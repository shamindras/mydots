-- import mason plugin safely
local mason_status, mason = pcall(require, 'mason')
if not mason_status then
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig =
  pcall(require, 'mason-lspconfig')
if not mason_lspconfig_status then
  return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, 'mason-null-ls')
if not mason_null_ls_status then
  return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    'cssls',
    'bashls',
    'emmet_ls',
    'html',
    'jedi_language_server',
    'pylsp',
    'pyright',
    'r_language_server',
    'lua_ls',
    'tailwindcss',
    'tsserver',
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
    'black', -- python formatter
    'blue', -- python formatter
    'eslint_d', -- ts/js linter
    'flake8', -- python linter
    'hadolint', -- docker linter
    'isort', -- python import sorter
    'prettier', -- ts/js formatter
    'proselint', -- prose linter
    'pyright', -- python type checker
    'shellcheck', -- shell linter
    'shellharden', -- shell formatter
    'shfmt', -- shell formatter
    'stylua', -- lua formatter
    'taplo', -- toml linter
    'write_good', -- naive prose linter for English
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
})
