local handle = require('framework.handle')
local json = require('cjson.safe')

local error = {
    WITHOUT_NAME = { code = 401, error = 'without name' },
    BAD_NAME = { code = 402, error = 'bad name' },
    NO_SUCH_USER = { code = 403, error = 'no such user' }
}

local handlers = {
    POST = function()
        ngx.req.read_body()
        local req = json.decode(ngx.req.get_body_data())
        if req and req.name then
            if type(req.name) ~= 'string' or req.name == '' then
                return nil, error.BAD_NAME
            else
                return nil
            end
        else
            return nil, error.WITHOUT_NAME
        end
    end,
    GET = function()
        local db = { user_1 = { name = 'user_1', gender = 'male' } }
        local arg = ngx.req.get_uri_args()
        if not arg.name then
            return nil, error.WITHOUT_NAME
        elseif not db[arg.name] then
            return nil, error.NO_SUCH_USER
        else
            return db[arg.name]
        end
    end
}

ngx.say(handle(handlers))