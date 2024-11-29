require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "omnisharp",
    },
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
    completion = {
        keyword_length = 2,
    },
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

local on_attach_csharp = function(_, _)
   -- Key mappings specific to C# LSP using omnisharp_extended
   vim.keymap.set("n", "gd", require('omnisharp_extended').lsp_definition, {})
   vim.keymap.set("n", "<leader>D", require('omnisharp_extended').lsp_type_definition, {})
   vim.keymap.set("n", "gr", require('omnisharp_extended').lsp_references, {})
   vim.keymap.set("n", "gi", require('omnisharp_extended').lsp_implementation, {})

   -- Common mappings shared with other LSPs
   vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
   vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
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

local omnisharp_bin = "/home/charlie/Downloads/omnisharp-linux-x64-net6.0/OmniSharp.dll"

require("lspconfig").omnisharp.setup({
  on_attach = on_attach_csharp,
  capabilities = capabilities,
  cmd = { "dotnet", omnisharp_bin },
  -- Enables support for reading code style, naming convention and analyzer
  -- settings from .editorconfig.
  enable_editorconfig_support = true,
  -- If true, MSBuild project system will only load projects for files that
  -- were opened in the editor. This setting is useful for big C# codebases
  -- and allows for faster initialization of code navigation features only
  -- for projects that are relevant to code that is being edited. With this
  -- setting enabled OmniSharp may load fewer projects and may thus display
  -- incomplete reference lists for symbols.
  enable_ms_build_load_projects_on_demand = false,
  -- Enables support for roslyn analyzers, code fixes and rulesets.
  enable_roslyn_analyzers = false,
  -- Specifies whether 'using' directives should be grouped and sorted during
  -- document formatting.
  organize_imports_on_format = true,
  -- Enables support for showing unimported types and unimported extension
  -- methods in completion lists. When committed, the appropriate using
  -- directive will be added at the top of the current file. This option can
  -- have a negative impact on initial completion responsiveness,
  -- particularly for the first few completion sessions after opening a
  -- solution.
  enable_import_completion = true,
  -- Specifies whether to include preview versions of the .NET SDK when
  -- determining which version to use for project loading.
  sdk_include_prereleases = true,
  -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
  -- true
  analyze_open_documents_only = false,
})

