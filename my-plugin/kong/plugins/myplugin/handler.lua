local http = require "resty.http"

local clear_header = kong.service.request.clear_header
local get_headers = kong.request.get_headers

-- If you're not sure your plugin is executing, uncomment the line below and restart Kong
-- then it will throw an error which indicates the plugin is being loaded at least.

--assert(ngx.get_phase() == "timer", "The world is coming to an end!")

---------------------------------------------------------------------------------------------
-- In the code below, just remove the opening brackets; `[[` to enable a specific handler
--
-- The handlers are based on the OpenResty handlers, see the OpenResty docs for details
-- on when exactly they are invoked and what limitations each handler has.
---------------------------------------------------------------------------------------------



local plugin = {
    PRIORITY = 1000, -- set the plugin priority, which determines plugin execution order
    VERSION = "0.1",
}


-- do initialization here, any module level code runs in the 'init_by_lua_block',
-- before worker processes are forked. So anything you add here will run once,
-- but be available in all workers.



-- handles more initialization, but AFTER the worker process has been forked/created.
-- It runs in the 'init_worker_by_lua_block'
function plugin:init_worker()
    -- your custom code here
    kong.log.debug("saying hi from the 'init_worker' handler")
end

-- runs in the 'access_by_lua_block'
function plugin:access(plugin_conf)
    -- custom code logic here
end

-- runs in the 'access_by_lua_block'
function plugin:response(plugin_conf)
    -- your custom code here, for example;
    kong.log.debug("saying hi from the 'response' handler")
end

-- runs in the 'log_by_lua_block'
function plugin:log(plugin_conf)
    -- your custom code here
    kong.log.debug("saying hi from the 'log' handler")
end --]]

-- return our plugin object
return plugin
