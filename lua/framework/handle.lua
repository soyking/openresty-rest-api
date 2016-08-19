local transfer = require('framework.transfer')
local resp = require('framework.resp')

local handle = function(handlers)
    handler = handlers[ngx.req.get_method()]
    if handler then
        return resp(transfer(handler))
    else
        ngx.status = ngx.HTTP_NOT_ALLOWED
        return
    end
end

return handle