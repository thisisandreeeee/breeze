--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })
vim.keymap.set('c', '<Tab>', '<C-g>', { noremap = true, desc = 'Move to next match' })
vim.keymap.set('c', '<S-Tab>', '<C-t>', { noremap = true, desc = 'Move to previous match' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Move lines in normal/visual mode
vim.keymap.set('n', '<S-j>', ':m .+1<CR>==', { noremap = true, silent = true, desc = 'Move line down' })
vim.keymap.set('n', '<S-k>', ':m .-2<CR>==', { noremap = true, silent = true, desc = 'Move line up' })

-- Append text after cursor when pressing I
vim.keymap.set('n', 'I', 'a', { noremap = true, silent = true, desc = 'Append text after cursor' })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Jump to the last known cursor position when opening a file
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    local last_pos = vim.fn.line '\'"'
    if last_pos > 1 and last_pos <= vim.fn.line '$' then
      vim.cmd 'normal! g\'"'
    end
  end,
})
