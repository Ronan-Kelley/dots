(local util (require :util))

[{1 :lervag/vimtex
  :lazy true
  :ft "tex"
  :config (fn [] 
            (let [viewer :zathura
                  opts {
                    ; don't use temp files
                    :vimtex_view_use_tmp_files 0
                    ; use the selected viewer for everything
                    :vimtex_viewer_general viewer
                    :vimtex_context_pdf_viewer viewer
                    :vimtex_view_method viewer
                    :vimtex_view_general_viewer viewer}]
              (util.mapped-set vim.g opts)))}]
