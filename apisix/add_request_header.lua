
local core = require("apisix.core")
local clear_tab = require "table.clear"
local table = table

local plugin_name = "add-request-header"

local schema = {
    type = "object",
    properties = {
        new_header_name = { type = "string", default = "X-Kong-NEW-Header" },
        new_header_value = { type = "string", default = "LLM_VALUE" },
    },
}

local _M = {
    version = 0.1,
    priority = 1970,
    name = plugin_name,
    schema = schema,
    run_policy = "prefer_route",
}

function _M.check_schema(conf)
    local ok, err = core.schema.check(schema, conf)
    if not ok then
        return false, err
    end

    return true
end

function _M.access(conf, ctx)
    table.clear(new_header_value)
    core.request.set_header(ctx, "X-Kong-NEW-Header","LLM_VALUE" )
end

return _M


ngx.log(ngx.INFO, "hello world")
ngx.header["X-Kong-NEW-Header"] = "LLM_VALUE"