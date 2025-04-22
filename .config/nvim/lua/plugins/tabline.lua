return {
    {
        'nanozuki/tabby.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            -- reminder:
            -- TabRename will also work to rename tabs
            local theme = {
                fill = 'TabLineFill',
                -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
                head = 'TabLine',
                current_tab = 'TabLineSel',
                tab = 'TabLine',
            }

            local line = function(line)
                return {
                    line.tabs().foreach(function(tab)
                        local hl = tab.is_current() and theme.current_tab or theme.tab
                        return {
                            line.sep(' ', hl, theme.fill),
                            tab.number(),
                            tab.name(),
                            line.sep(' ', hl, theme.fill),
                            hl = hl,
                            margin = ' ',
                        }
                    end),
                }
            end
            require('tabby.tabline').set(line)
        end,
    },
}
