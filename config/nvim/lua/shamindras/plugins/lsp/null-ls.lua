-- import null-ls plugin safely
local setup, null_ls = pcall(require, 'null-ls')
if not setup then
  return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters
local code_actions = null_ls.builtins.code_actions -- to take specific code actions

-- to setup format on save
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

-- configure null_ls
null_ls.setup({
  -- setup formatters & linters
  sources = {
    -- lua
    formatting.stylua,

    -- js/ts
    formatting.prettier.with({
      disabled_filetypes = { 'python', 'lua', 'sh', 'markdown', 'tex' },
    }),
    diagnostics.eslint_d.with({ -- js/ts linter
      -- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
      condition = function(utils)
        return utils.root_has_file('.eslintrc.js') -- change file extension if you use something else
      end,
    }),

    -- text
    code_actions.proselint,
    diagnostics.proselint,
    diagnostics.write_good.with({
      extra_args = { '--no-adverb' },
      diagnostics_postprocess = function(diagnostic)
        diagnostic.severity = vim.diagnostic.severity.WARN
      end,
    }),

    -- shell
    formatting.shfmt,
    formatting.shellharden,
    diagnostics.shellcheck,
    -- code_actions.shellcheck,

    -- python
    formatting.black,
    formatting.isort,
    diagnostics.flake8,
  },
  -- configure format on save
  on_attach = function(current_client, bufnr)
    if current_client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            filter = function(client)
              --  only use null-ls for formatting instead of lsp server
              return client.name == 'null-ls'
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
})
