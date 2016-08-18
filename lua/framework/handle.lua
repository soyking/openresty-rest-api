local json = require("cjson")

local raw_handler = function (handler) 
    if handler then
    	return handler
    else
    	return ''
    end
end

local json_handler = function (handler)
    return json.encode(handler)
end

local function_handler = function(handler)
    ret = {}
    result, err = handler()
    if err then
    	ret['code'] = 400
    	ret['msg'] = err
    else
    	ret['code'] = 200
    	ret['msg'] = 'success'
    	if result then 
    		ret['result'] = result
    	end
    end
    return json.encode(ret)
end

local handler_switcher = {
    string = raw_handler,
    number = raw_handler,
    boolean = raw_handler,
    table = json_handler,
}

handler_switcher['nil'] = raw_handler
handler_switcher['function'] = function_handler


local handle = function (handlers)
    local handler = handlers[ngx.req.get_method()]
    if handler then
    	return handler_switcher[type(handler)](handler)
    end
end

return handle