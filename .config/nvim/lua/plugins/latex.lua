return {
    {
        "lervag/vimtex",
        lazy = true,
        ft = "tex",
        config = function()
            vim.g.vimtex_view_use_tmp_files = 0
            vim.g.vimtex_viewer_general = 'zathura'
            vim.g.vimtex_context_pdf_viewer = 'zathura'
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_view_general_viewer = 'zathura'
            vim.opt.conceallevel = 1
            vim.g.tex_conceal = 'abdmg'
        end
    }
}
