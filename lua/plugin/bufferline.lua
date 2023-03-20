require('bufferline').setup({
  options = {
    mode = 'buffers',
    offsets = {
      {filetype = 'fern'}
    },
  },
  highlights = {
    buffer_selected = {
      italic = false
    },
    indicator_selected = {
      fg = {attribute = 'fg', highlight = 'Function'},
      italic = false
    }
  }
})

