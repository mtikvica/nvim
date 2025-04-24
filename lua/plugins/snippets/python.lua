local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  -- Shebangs
  s('#!', t '#!/usr/bin/env python3'),
  s('#!2', {
    t { '#!/usr/bin/env python2', '# -*- coding: utf-8 -*-' },
  }),
  s('#!3', t '#!/usr/bin/env python3'),

  -- Imports
  s('imp', fmt('import {}', { i(1, 'module') })),
  s('from', fmt('from {} import {}', { i(1, 'package'), i(2, 'module') })),

  -- Main
  s('ifmain', {
    t "if __name__ == '__main__':",
    t { '', '\t' },
    i(0, 'main()'),
  }),

  -- Function
  s(
    'def',
    fmt(
      [[
    def {}({}):
        """{}"""
        {}
  ]],
      {
        i(1, 'function_name'),
        i(2),
        i(3, 'docstring'),
        i(0),
      }
    )
  ),

  -- Class
  s(
    'cl',
    fmt(
      [[
    class {}({}):
        """{}"""
        def __init__(self, {}):
            {}
            self.{} = {}
            {}
  ]],
      {
        i(1, 'ClassName'),
        i(2, 'object'),
        i(3, 'docstring'),
        i(4, 'arg'),
        i(5, 'super().__init__()'),
        rep(4),
        rep(4),
        i(0),
      }
    )
  ),

  -- Try/Except
  s(
    'try',
    fmt(
      [[
    try:
        {}
    except {} as {}:
        {}
  ]],
      {
        i(1),
        i(2, 'Exception'),
        i(3, 'e'),
        i(0, 'raise e'),
      }
    )
  ),

  -- With statement
  s(
    'with',
    fmt(
      [[
    with {} as {}:
        {}
  ]],
      {
        i(1, 'expr'),
        i(2, 'var'),
        i(0),
      }
    )
  ),

  -- Logger
  s('glog', {
    t 'import logging',
    t { '', 'LOGGER = logging.getLogger(__name__)' },
  }),
  s('lg', fmt('LOGGER.debug({})', { i(0, 'msg') })),
  s('li', fmt('LOGGER.info({})', { i(0, 'msg') })),
  s('le', fmt('LOGGER.error({})', { i(0, 'msg') })),

  -- Print
  s('pr', fmt('print({})', { i(0) })),
  s('prf', fmt('print(f"{}")', { i(0) })),

  -- Property
  s(
    'property',
    fmt(
      [[
    @property
    def {}(self) -> {}:
        """{}"""
        return self._{}

    @{}.setter
    def {}(self, value: {}):
        self._{} = value
  ]],
      {
        i(1, 'name'),
        i(2, 'type'),
        i(3, 'description'),
        rep(1),
        rep(1),
        rep(1),
        rep(2),
        rep(1),
      }
    )
  ),

  -- Unicode
  s(
    'uni',
    fmt(
      [[
    def __unicode__(self):
        {}
  ]],
      {
        i(0, 'return representation'),
      }
    )
  ),
}
