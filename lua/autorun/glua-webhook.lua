if SERVER then
    include("glua-webhook/config.lua")
    include("glua-webhook/webhook.lua")
    for _, _file in pairs(file.Find("glua-webhook/modules/*.lua", "LUA")) do
        include("glua-webhook/modules/" .. _file)
        MsgC(Color(200, 200, 100), "[GLUA-DISC] Included Module: " .. _file)
    end
end