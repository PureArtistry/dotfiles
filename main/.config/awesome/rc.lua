-- awesome_mode: api-level=4:screen=on:replace
pcall(require, 'luarocks.loader')

local naughty = require('naughty')
naughty.connect_signal('request::display_error', function(message, startup)
    naughty.notification {
        urgency = 'critical',
        title   = 'Error processing config'..(startup and ' during startup!' or '!'),
        message = message
    }
end)

require('config')
