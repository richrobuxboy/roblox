local framework = {
    functions = {},
    connections = {},
    initiated = tick()
};

writefile("sentinelLogs.txt", "sentinel initiated.\n");

-- functions
do
   framework.functions.getservice = function(...)
        local services = {};
        for i, name in ipairs({...}) do
            services[i] = cloneref(game:GetService(name));
        end;
        return unpack(services);
    end;
    getservice = framework.functions.getservice; 
    -- 
    framework.functions.logs = function(txt)
        appendfile("sentinelLogs.txt", txt.." | "..string.format("%.3f s", tick() - framework.initiated));
        appendfile("sentinelLogs.txt", "\n");
    end;
    logs = framework.functions.logs;
end;
--
return framework;
