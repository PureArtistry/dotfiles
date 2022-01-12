local n_ok = PREQ(true, 'notify')
if not n_ok[1] then error() end
n_ok[2].setup({
    stages = 'slide',
    on_open = nil,
    on_close = nil,
    timeout = 3000,
    render = 'default',
    background_color = FLAVOURS.base01,
    minimum_width = 50,
    icons = {
        ERROR = ' ',
        WARN = ' ',
        INFO = ' ',
        DEBUG = ' ',
        TRACE = '✎ '
    }
})
