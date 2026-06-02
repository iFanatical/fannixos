return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    lazy = false,
    config = function()
        require('nvim-treesitter').install({
            'lua',
            'bash',
            'nix',
            'markdown',
            'markdown_inline',
            'vim',
            'vimdoc',
        })

        vim.api.nvim_create_autocmd('FileType', {
            callback = function(args)
                local filetype = args.match
                local lang = vim.treesitter.language.get_lang(filetype)
                if lang and pcall(vim.treesitter.start, args.buf, lang) then
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end
}
