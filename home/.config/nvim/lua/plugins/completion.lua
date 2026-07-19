return {
  {
    'saghen/blink.cmp',
    version = '1.*',            -- ships a prebuilt fuzzy matcher, so no Rust toolchain needed
    event = 'InsertEnter',      -- the completion menu is only needed while typing
    opts = {
      -- default preset: <C-space> opens the menu, <C-y> accepts, <C-n>/<C-p> or arrows navigate
      keymap = { preset = 'default' },
      -- where suggestions come from; lsp (vtsls & friends) is the smart one, the rest are fallbacks
      sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
      completion = { documentation = { auto_show = true } },  -- show doc popup for the highlighted item
    },
  },
}
