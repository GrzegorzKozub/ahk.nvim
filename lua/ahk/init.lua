local M = {}

local function normalize(opts)
  opts = opts or {}
  opts.interpreter = opts.interpreter or 'AutoHotkey64.exe'
  return opts
end

local function add_server(opts)
  local configs_loaded, configs = pcall(require, 'lspconfig.configs')
  if not configs_loaded then
    return
  end

  if configs.ahk then
    return
  end

  configs.ahk = {
    default_config = {
      autostart = true,
      cmd = {
        'node.exe',
        vim.fn.stdpath 'state' .. '/lazy/ahk.nvim/lsp/server/dist/server.js',
        '--stdio',
      },
      filetypes = { 'autohotkey' },
      flags = { debounce_text_changes = 500 },
      init_options = {
        InterpreterPath = opts.interpreter,
        locale = 'en-us',
      },
      settings = {},
      single_file_support = true,
    },
  }
end

function M.setup(opts)
  add_server(normalize(opts))
end

return M
