-- taken from goolord/alpha-nvim
local list_extend = vim.list_extend

local format_line = function(line, max_width)
    if line == "" then
        return { " " }
    end

    local formatted_line = {}

    local words = {}
    local target = "%S+"
    for word in line:gmatch(target) do
        table.insert(words, word)
    end

    local bufstart = " "
    local buffer = bufstart
    for i, word in ipairs(words) do
        if (#buffer + #word) <= max_width then
            buffer = buffer .. word .. " "
            if i == #words then
                table.insert(formatted_line, buffer:sub(1, -2))
            end
        else
            table.insert(formatted_line, buffer:sub(1, -2))
            buffer = bufstart .. word .. " "
            if i == #words then
                table.insert(formatted_line, buffer:sub(1, -2))
            end
        end
    end

    if line:sub(1, 1) == "-" then
        for i, val in ipairs(formatted_line) do
            local space = string.rep(" ", max_width - #val - 2)
            formatted_line[i] = space .. val:sub(2, -1)
        end
    end
    return formatted_line
end

local format_fortune = function(fortune, max_width)
    local formatted_fortune = { " " }
    for _, line in ipairs(fortune) do
        local formatted_line = format_line(line, max_width)
        formatted_fortune = list_extend(formatted_fortune, formatted_line)
    end
    return formatted_fortune
end

local get_fortune = function(fortune_list)
    math.randomseed(os.time())
    local ind = math.random(1, #fortune_list)
    return fortune_list[ind]
end

local main = function(max_width)
    max_width = max_width or 54
    math.randomseed(os.time())
    local chance = math.random(1, 100)
    local favs = true
    if chance < 40 then favs = false end
    local fortune = get_fortune(require('dashboard.quotes').get(favs))
    local formatted_fortune = format_fortune(fortune, max_width)

    return formatted_fortune
end

return main
