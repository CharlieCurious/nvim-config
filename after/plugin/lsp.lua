require("mason").setup()
require("mason-lspconfig").setup({
   ensure_installed = { "lua_ls", "clangd", "csharp_ls" }
})

local on_attach = function(_, _)
   vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
   vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

   vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
   vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
   vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
   vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end

require("lspconfig").lua_ls.setup {
   on_attach = on_attach
}

require("lspconfig").clangd.setup {
   on_attach = on_attach
}

-- Setup csharp_ls with additional configuration
local util = require 'lspconfig.util'
require("lspconfig").csharp_ls.setup {
  cmd = { 'csharp-ls' },  -- Command to start the C# language server
  filetypes = { 'cs' },    -- Specify the filetypes it applies to
  root_dir = function(fname)
    return util.root_pattern('*.sln')(fname) or util.root_pattern('*.csproj')(fname)
  end,
  init_options = {
    AutomaticWorkspaceInit = true,  -- Automatically initialize the workspace
  },
  on_attach = on_attach,  -- Reuse the existing on_attach function for keybindings
}
