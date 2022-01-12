local good = PREQ(true, 'telescope')
if not good[1] then
    NOTIFY({ type = 'error', title = 'telescope', msg = 'failed to load telescope!' })
    return
end
good[2].setup {}
