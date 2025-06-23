[{1 :nacro90/numb.nvim
  :lazy false
  :config (fn []
            ; need to call setup or plugin does nothing
            ((. (require :numb) :setup)))
 }]
 ; {1 :chrisgrieser/nvim-spider
 ;  :lazy true
 ;  :keys [{1 :w 2 "<cmd>lua require('spider').motion('w')<CR>" :mode [:n :o :x]}
 ;         {1 :e 2 "<cmd>lua require('spider').motion('e')<CR>" :mode [:n :o :x]}
 ;         {1 :b 2 "<cmd>lua require('spider').motion('b')<CR>" :mode [:n :o :x]}]
 ;  :config (fn []
 ;            ((. (require :spider) :setup) {:consistentOperatorPending false
 ;                                           :customPatterns {}
 ;                                           :skipInsignificantPunctuation false
 ;                                           :subwordMovement true}))
 ;  }]	
