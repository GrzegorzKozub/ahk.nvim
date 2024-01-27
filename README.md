# ahk.nvim

Downloads [vscode-autohotkey2-lsp](https://github.com/thqby/vscode-autohotkey2-lsp/) using the `install.js` script provided by the LSP author and configures it as a custom server for [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig). Requires [AutoHotkey](https://www.autohotkey.com/).

Install using [lazy.nvim](https://github.com/folke/lazy.nvim/):

```lua
{
  'GrzegorzKozub/ahk.nvim',
  cond = vim.fn.has 'win32' == 1,
  opts = { interpreter = 'AutoHotkey64.exe' },
}
```

Setup as a dependency for [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig):

```lua
{
  'neovim/nvim-lspconfig',
  dependencies = vim.fn.has 'win32' == 1 and { 'GrzegorzKozub/ahk.nvim' } or { },
  opts = { }
}
```