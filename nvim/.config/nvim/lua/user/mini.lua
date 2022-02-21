-- MiniBufremove setup
require('mini.bufremove').setup({
  -- Whether to set Vim's settings for buffers (allow hidden buffers)
  set_vim_settings = true,
})

-- MiniJump setup
require('mini.jump').setup({
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    forward = 'f',
    backward = 'F',
    forward_till = 't',
    backward_till = 'T',
    repeat_jump = ';',
  },
  -- Delay (in ms) between jump and highlighting all possible jumps. Set to
  -- a very big number (like 10^7) to virtually disable highlighting.
  highlight_delay = 250,
})

-- MiniSurround setup
require('mini.surround').setup({
  -- Number of lines within which surrounding is searched
  n_lines = 20,
  -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
  highlight_duration = 500,
  -- Pattern to match function name in 'function call' surrounding
  -- By default it is a string of letters, '_' or '.'
  funname_pattern = '[%w_%.]+',
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    add = 'sa', -- Add surrounding
    delete = 'sd', -- Delete surrounding
    find = 'sf', -- Find surrounding (to the right)
    find_left = 'sF', -- Find surrounding (to the left)
    highlight = 'sh', -- Highlight surrounding
    replace = 'sr', -- Replace surrounding
    update_n_lines = 'sn', -- Update `n_lines`
  },
})

