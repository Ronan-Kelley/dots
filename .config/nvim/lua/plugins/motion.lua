return
{
    {
        -- peek lines you're jumping to with :<number>
        'nacro90/numb.nvim',
        lazy = false,
        config = function()
            require('numb').setup()
        end,
    },
    {
        -- better movement for w/e/b
        'chrisgrieser/nvim-spider',
        lazy = true,
        keys = {
            { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
            { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
            { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
        },
        config = function()
            require('spider').setup({
                skipInsignificantPunctuation = true,
                consistentOperatorPending = false,
                subwordMovement = true,
                customPatterns = {},
            })
        end
    },
}
