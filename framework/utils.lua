local framework = {
    modules = {},
    instances = {},
    connections = {},
};

local init = tick();
writefile("sentinelLogs.txt", "sentinel initiated.\n");

-- modules
local modules = framework.modules;
do
   modules.getservice = function(...)
        local services = {};
        for i, name in ipairs({...}) do
            services[i] = cloneref(game:GetService(name));
        end;
        return unpack(services);
    end;
    getservice = modules.getservice; 
    -- 
    modules.logs = function(txt)
        appendfile("sentinelLogs.txt", txt.." | "..string.format("%.3f s", tick() - init));
        appendfile("sentinelLogs.txt", "\n");
    end;
    logs = modules.logs;
    -- 
    modules.instance_new = function(class, properties)
        local _instance = Instance.new(class);
        for _property, _value in next, properties do
            _instance[_property] = _value;
        end;
        table.insert(framework.instances, _instance);
        return _instance;
    end;
    instance_new = modules.instance_new;
    --
    modules.unload = function()
        for _, instance in pairs(framework.instances) do
            instance:Destroy();
        end;
    end;
    unload = modules.unload;
end;
--
return framework;
