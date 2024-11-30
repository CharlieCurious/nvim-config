require('lualine').setup {
    options = {
        theme = 'auto',
        section_separators = {'', ''},
        component_separators = {'', ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            'branch',
            {
                'diff',
                colored = true,
                symbols = { added = '+', modified = '~', removed = '-' }
            },
            -- Show modified indicator
            {
                'diagnostics',
                sources = { 'nvim_lsp' },  -- optional: shows LSP diagnostics
            },
            -- Adding modified status
            {
                condition = function()
                    return vim.bo.modified
                end,
            },
        },
        lualine_c = {
            'filename',
            function()
                for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                    if vim.api.nvim_buf_get_option(buf, 'modified') then
                        return ' | Unsaved buffers |' -- any message or icon
                    end
                end
                return ''
            end,
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'},
    },
    extensions = {'fugitive'}
}

