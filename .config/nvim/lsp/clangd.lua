return {
    -- disable automatic header insertion because it doesn't play nice with
    -- the way we do unit tests at work
    cmd = {"clangd", "-header-insertion=never"},
}
