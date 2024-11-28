require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "csharp_ls",
    }
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    sources = {
        { name = 'nvim_lsp' }
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(_, _)
   vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
   vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

   vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
   vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
   vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
   vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end

require("lspconfig").lua_ls.setup {
   on_attach = on_attach,
   capabilities = capabilities
}

require("lspconfig").clangd.setup {
   on_attach = on_attach,
   capabilties = capabilities
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
  capabilties = capabilities
}

