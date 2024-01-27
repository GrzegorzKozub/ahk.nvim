local dir = vim.fn.stdpath 'state' .. '/lazy/ahk.nvim/lsp'

vim.system({ 'mkdir', dir }, function()
  vim.system({
    'curl',
    '--location',
    '--output',
    'install.js',
    'https://raw.githubusercontent.com/thqby/vscode-autohotkey2-lsp/main/tools/install.js',
  }, { cwd = dir }, function()
    vim.system({ 'node', 'install.js' }, { cwd = dir })
  end)
end)
