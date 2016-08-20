local raw_transfer = function(entry)
    return entry
end

local func_transfer = function(entry)
    return entry()
end

local type_transfer = {}
type_transfer['string'] = raw_transfer
type_transfer['number'] = raw_transfer
type_transfer['boolean'] = raw_transfer
type_transfer['nil'] = raw_transfer
type_transfer['table'] = raw_transfer
type_transfer['function'] = func_transfer

local transfer = function(entry)
    local t = type_transfer[type(entry)]
    if t then
        return t(entry)
    else
        return entry
    end
end

return transfer
