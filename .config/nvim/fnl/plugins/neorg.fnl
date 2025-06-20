(local util (require :util))

{1 :nvim-neorg/neorg
 :lazy false
 :config (fn []
           ((. (require :neorg) :setup) {:load {:core.concealer {}
                                                :core.defaults {}
                                                :core.dirman {:config {:workspaces {:notes "~/notes"}
                                                                       :default_workspace :notes
                                                                       :index :index.norg}}}})
           (util.mapped-set vim.wo {:foldlevel 99
                                    :conceallevel 2}))}
