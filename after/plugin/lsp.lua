local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.setup({ virtual_text = true })

vim.diagnostic.config({ virtual_text = true })

local lspconfig = require("lspconfig")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

lspconfig.efm.setup({
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      lua = { require("efmls-configs.linters.luacheck"), require("efmls-configs.formatters.stylua") },
      go = {
        -- require("efmls-configs.linters.golangci_lint"),
        require("efmls-configs.formatters.gofmt"),
        require("efmls-configs.formatters.goimports"),
        require("efmls-configs.formatters.golines"),
        require("efmls-configs.formatters.eslint"),
        require("efmls-configs.linters.eslint"),
      },
    },
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
          -- vim.cmd(":Format<CR>")
        end,
      })
    end
  end,
})

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
})

local caps = vim.tbl_deep_extend(
  'force',
  vim.lsp.protocol.make_client_capabilities(),
  require('cmp_nvim_lsp').default_capabilities(),
  -- File watching is disabled by default for neovim.
  -- See: https://github.com/neovim/neovim/pull/22405
  { workspace = { didChangeWatchedFiles = { dynamicRegistration = true } } }
);

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
    },
  },
})

lspconfig.tsserver.setup({
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
})

lspconfig.eslint.setup({})

lspconfig.gopls.setup({
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "tmpl" },
  settings = { gopls = { completeUnimported = true, usePlaceholders = true, analyses = { unusedparams = true } } },
})

lspconfig.gdscript.setup({})
lspconfig.nil_ls.setup {
  autostart = true,
  capabilities = caps,
  settings = {
    ['nil'] = {
      testSetting = 42,
      formatting = {
        command = { "nixpkgs-fmt" },
      },
    },
  },
}
lspconfig.svelte.setup({})
-- lspconfig.nixd.setup({})
