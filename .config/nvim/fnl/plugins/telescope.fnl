[{1 :nvim-telescope/telescope.nvim
  :tag :0.1.8
  :dependencies [:nvim-lua/plenary.nvim]
  :keys [{1 :<leader>tb
          2 "<cmd>lua require('telescope.builtin').buffers()<CR>"
          :mode [:n]}
         {1 :<leader>tf
          2 "<cmd>lua require('telescope.builtin').find_files()<CR>"
          :mode [:n]}
         {1 :<leader>tF
          2 "<cmd>lua require('telescope.builtin').find_files({ hidden = true, no_ignore = true, no_ignore_parent = true })<CR>"
          :mode [:n]}
         {1 :<leader>ts
          2 "<cmd>lua require('telescope.builtin').live_grep()<CR>"
          :mode [:n]}
         {1 :<leader>tS
          2 "<cmd>lua require('telescope.builtin').live_grep({ additional_args = { '--no-ignore', '--hidden' }})<CR>"
          :mode [:n]}
         {1 :<leader>tgc
          2 "<cmd> lua require('telescope.builtin').git_commits()<CR>"
          :mode [:n]}
         {1 :<leader>tgb
          2 "<cmd> lua require('telescope.builtin').git_branches()<CR>"
          :mode [:n]}
         {1 :<leader>tgs
          2 "<cmd> lua require('telescope.builtin').git_status()<CR>"
          :mode [:n]}]
  :config (fn []
            ; telescope theme - uses the highlight group names
            (local telescope-prompt
                   {:TelescopePromptNormal {:bg "#2d3149"}
                    :TelescopePromptBorder {:bg "#2d3149"}
                    ; same color title and background makes it easier to hide
                    ; titles for builtins that override the default
                    ; prompt/preview/results title fields
                    :TelescopePromptTitle  {:bg "#2d3149" :fg "#2d3149"}
                    :TelescopePreviewTitle {:bg "#171720" :fg "#171720"}
                    :TelescopeResultsTitle {:bg "#171720" :fg "#171720"}})
            (each [hl col (pairs telescope-prompt)]
              (vim.api.nvim_set_hl 0 hl col))

            ; set defaults for telescope
            ((. (require :telescope) :setup) {
                :defaults {:border true
                           ; empty border chars with borders enabled will keep the
                           ; natural-looking padding; no borders leaves weird gaps
                           :borderchars [" "
                                         " "
                                         " "
                                         " "
                                         " "
                                         " "
                                         " "
                                         " "]
                           ; move the prompt to the top
                           :layout_config {:horizontal {:height 0.9
                                                        :preview_cutoff 120
                                                        :prompt_position :top
                                                        :width 0.8}}
                           ; winblend is basically transparency
                           :winblend 25}
                ; bind <C-d> to delete the hovered buffer in the buffers picker
                :pickers {:buffers {:mappings {:n {:<C-d> :delete_buffer}}}}}))
 }
 {1 :crispgm/telescope-heading.nvim
  :dependencies [:nvim-telescope/telescope.nvim]
  :keys [{1 :<leader>th
          2 "<cmd>lua require('telescope').extensions.heading.heading()<CR>"
          :mode [:n]}]
  ; need to register the extension with telescope
  :config (fn [] (local telescope (require :telescope))
            (telescope.load_extension :heading))}]
