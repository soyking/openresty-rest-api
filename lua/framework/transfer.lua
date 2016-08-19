local json = require('cjson')

local raw_transfer = function(data)
    return data
end

local func_transfer = function(data)
    return data()
end

local type_transfer = {}
type_transfer['string'] = raw_transfer
type_transfer['number'] = raw_transfer
type_transfer['boolean'] = raw_transfer
type_transfer['nil'] = raw_transfer
type_transfer['table'] = raw_transfer
type_transfer['function'] = func_transfer

local transfer = function(data)
    local t = type_transfer[type(data)]
    if t then
        return t(data)
    else
        return data
    end
end

return transfer
