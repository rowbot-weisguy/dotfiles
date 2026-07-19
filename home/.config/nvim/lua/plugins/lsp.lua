return {
  -- downloads language server binaries so you never install them by hand
  { 'mason-org/mason.nvim', opts = {} },

  {
    'neovim/nvim-lspconfig',  -- ships sane default configs for each language server
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      -- bridges mason and lspconfig; installs anything listed in ensure_installed
      { 'mason-org/mason-lspconfig.nvim', opts = { ensure_installed = { 'vtsls' } } },
      'saghen/blink.cmp',
    },
    config = function()
      -- tell every server what our completion engine can handle (snippets, extra fields)
      vim.lsp.config('*', {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
      })

      -- vtsls: the TypeScript / JavaScript language server (the intelligence behind completions,
      -- diagnostics, hover, rename). nvim 0.12's built-in keymaps cover the rest:
      --   K = hover docs, grn = rename, gra = code action, grr = references
      vim.lsp.enable('vtsls')
    end,
  },
}
