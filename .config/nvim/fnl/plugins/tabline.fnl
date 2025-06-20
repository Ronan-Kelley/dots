[{1 :nanozuki/tabby.nvim
  :dependencies :nvim-tree/nvim-web-devicons
  :config (fn []
            (local theme {:current_tab :TabLineSel
                          :fill :TabLineFill
                          :head :TabLine
                          :tab :TabLine})

            (fn line [line]
              [((. (line.tabs) :foreach) (fn [tab]
                                           (local hl
                                                  (or (and (tab.is_current)
                                                           theme.current_tab)
                                                      theme.tab))
                                           {1 (line.sep " " hl theme.fill)
                                            2 (tab.number)
                                            3 (tab.name)
                                            4 (line.sep " " hl theme.fill)
                                            : hl
                                            :margin " "}))])

            ((. (require :tabby.tabline) :set) line))}]	
