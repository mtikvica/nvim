return {
  'L3MON4D3/LuaSnip',
  build = (function()
    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
      return
    end
    return 'make install_jsregexp'
  end)(),
  config = function()
    require('luasnip.loaders.from_snipmate').load { paths = vim.fn.stdpath 'config' .. '/snippets' }
    require('luasnip.loaders.from_lua').load { paths = vim.fn.stdpath 'config' .. '/lua/snippets' }
  end,
}
