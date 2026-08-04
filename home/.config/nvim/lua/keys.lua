-- save by pressing Escape
vim.keymap.set('n', '<Esc>', ':w<CR>', { desc = 'Save' })
-- force hjkl navigation by unbinding the arrow keys
for _, key in ipairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
  vim.keymap.set({ 'n', 'i', 'v' }, key, '<Nop>', { desc = 'Disabled: use hjkl' })
end
-- select all
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'Select All' })
-- pasting over a selection no longer clobbers your clipboard
vim.cmd([[ xnoremap <expr> p 'pgv"'.v:register.'y' ]])
