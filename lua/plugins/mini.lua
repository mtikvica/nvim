return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      -- 1. Sensible defaults (options, keymaps, autocommands)
      require('mini.basics').setup {
        options = {
          basic = true,
          extra_ui = true,
          win_borders = 'single',
        },
        mappings = {
          basic = true,
          windows = true,
          move_with_alt = true,
        },
        autocommands = {
          basic = true,
          relnum_in_visual_mode = true,
        },
      }

      require('mini.ai').setup()
      require('mini.operators').setup()
      require('mini.statusline').setup()
      require('mini.jump2d').setup()
      require('mini.notify').setup()
      require('mini.starter').setup()
      require('mini.animate').setup()

      require('mini.indentscope').setup {
        symbol = '│',
        options = { try_as_border = true },
      }

      require('mini.comment').setup()

      -- 5. Auto pairs (brackets, quotes, etc.)
      require('mini.pairs').setup()

      -- 6. Surround like `ds"` or `ysiw)`
      require('mini.surround').setup()
    end,
  },
}
