return {
  { -- Install and manage Treesitter parsers and queries
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local parsers = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'python',
        'toml',
      }

      require('nvim-treesitter').install(parsers):wait(300000)

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('breeze-treesitter', { clear = true }),
        callback = function(args)
          local ok = pcall(vim.treesitter.start, args.buf)
          if not ok then
            return
          end

          vim.wo[0].foldmethod = 'expr'
          vim.wo[0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  { -- Shows the context that you are currently in
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        multiline_threshold = 1,
      }
    end,
  },
}
