--[[
  /$$$$$$  /$$                            /$$$$$$$  /$$                                              /$$
 /$$__  $$| $$                           | $$__  $$|__/                                             | $$
| $$  \__/| $$ /$$   /$$ /$$$$$$         | $$  \ $$ /$$  /$$$$$$$  /$$$$$$$  /$$$$$$   /$$$$$$  /$$$$$$$
| $$ /$$$$| $$| $$  | $$|____  $$ /$$$$$$| $$  | $$| $$ /$$_____/ /$$_____/ /$$__  $$ /$$__  $$/$$__  $$
| $$|_  $$| $$| $$  | $$ /$$$$$$$|______/| $$  | $$| $$|  $$$$$$ | $$      | $$  \ $$| $$  \__/ $$  | $$
| $$  \ $$| $$| $$  | $$/$$__  $$        | $$  | $$| $$ \____  $$| $$      | $$  | $$| $$     | $$  | $$
|  $$$$$$/| $$|  $$$$$$/  $$$$$$$        | $$$$$$$/| $$ /$$$$$$$/|  $$$$$$$|  $$$$$$/| $$     |  $$$$$$$
 \______/ |__/ \______/ \_______/        |_______/ |__/|_______/  \_______/ \______/ |__/      \_______/
    Purpose: Autorun file, includes modules                                                                                                                                                                                                                                                                                    
]]
if SERVER then
    include("glua-webhook/config.lua")
    include("glua-webhook/webhook.lua")
    include("glua-webhook/sv_hooks.lua")
    for _, _file in pairs(file.Find("glua-webhook/modules/*.lua", "LUA")) do
        include("glua-webhook/modules/" .. _file)
        MsgC(Color(200, 200, 100), "[GLUA-DISC] Included Module: " .. _file .. "\n")
    end
end