return {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      -- Ensure true color support
      vim.opt.termguicolors = true

      -- Setup: render background color blocks for recognized color strings
      require('nvim-highlight-colors').setup {
        render = 'background', -- show colored background (what you asked for)
        enable_hex = true, -- #RRGGBB
        enable_short_hex = true, -- #RGB
        enable_rgb = true, -- rgb(...)
        enable_hsl = true, -- hsl(...)
        enable_hsl_without_function = true, -- hsl values without function (css vars)
        enable_var_usage = true, -- var(--css-variable)
        enable_named_colors = true, -- named colors like 'red'
        enable_tailwind = true, -- set true if you use tailwind class names
        -- you can add custom_colors or exclusions here if needed
        -- custom_colors = { { label = '%-%-my%-color', color = '#123456' } },
        custom_colors = {
          {
            label = 'Color(0x%x%x%x%x%x%x%x%x',
            color = function(match)
              -- remove 0x and alpha (first 2 bytes)
              local hex = match:sub(11) -- skip 0xAA
              return '#' .. hex
            end,
          },
        },
        -- exclude_filetypes = { 'markdown' }, -- example
      }
    end,
  }
