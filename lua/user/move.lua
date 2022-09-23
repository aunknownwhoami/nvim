local status_ok, move = pcall(require, "move")
if not status_ok then
  return
end

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<S-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<S-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('v', '<S-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<S-k>', ':MoveBlock(-1)<CR>', opts)

vim.keymap.set('n', '<S-h>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<S-l>', ':MoveHChar(1)<CR>', opts)
vim.keymap.set('v', '<S-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<S-l>', ':MoveHBlock(1)<CR>', opts)
