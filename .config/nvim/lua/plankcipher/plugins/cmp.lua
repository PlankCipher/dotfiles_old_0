local luasnip = require('luasnip')
local cmp = require('cmp')

local kind_icons = {
  Text = '',
  Method = '',
  Function = '',
  Constructor = '',
  Field = '',
  Variable = '',
  Class = 'ﴯ',
  Interface = '',
  Module = '',
  Property = 'ﰠ',
  Unit = '',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = ''
}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-y>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    {name = 'path'},
    {name = 'buffer'},
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format('  %s %s', kind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        path = '[Path]',
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        luasnip = '[Snip]',
      })[entry.source.name]
      return vim_item
    end
  },
  window = {
    completion = {border = 'rounded'},
    documentation = {border = 'rounded'},
  },
  experimental = {
    ghost_text = true,
  }
})
