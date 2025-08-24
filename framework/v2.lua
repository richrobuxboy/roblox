local framework = {
    functions = {},
    connections = {}
};
-- functions
do
   framework.functions.getservice = function(...)
        local services = {}
        for i, name in ipairs({...}) do
            services[i] = cloneref(game:GetService(name))
        end
        return unpack(services)
    end
    getservice = framework.functions.getservice; 
    -- 
    
end;
--
return framework;
