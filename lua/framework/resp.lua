local const = require('framework.const')
local json = require('cjson')

local build_resp = function(data, err)
    local resp = {
        code = const.DEFAULT_SUCCESS_CODE,
        msg = const.DEFAULT_SUCCESS_MSG
    }

    if err then
        resp.code = err.code or const.DEFAULT_ERR_CODE
        resp.msg = err.error or err
    elseif data then
        resp.data = data
    end

    return resp
end

local resp = function(data, err)
    return json.encode(build_resp(data, err))
end

return resp