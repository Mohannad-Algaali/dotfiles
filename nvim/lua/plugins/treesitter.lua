return { -- Highlight, edit, and navigate code
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        -- Core
        'c',
        'lua',
        'vim',
        'vimdoc',
        'query',
        -- PHP / Laravel
        'php',
        'php_only',
        'blade',
        -- JavaScript / TypeScript
        'javascript',
        'typescript',
        'tsx',
        'jsdoc',
        -- Web (React, React Native)
        'html',
        'css',
        'json',
        'jsonc',
        -- Additional useful parsers
        'bash',
        'markdown',
        'markdown_inline',
        'regex',
        'yaml',
        'kotlin',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
  }
