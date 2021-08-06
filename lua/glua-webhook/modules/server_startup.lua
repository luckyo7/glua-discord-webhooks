--[[
  /$$$$$$  /$$                            /$$$$$$$  /$$                                              /$$
 /$$__  $$| $$                           | $$__  $$|__/                                             | $$
| $$  \__/| $$ /$$   /$$ /$$$$$$         | $$  \ $$ /$$  /$$$$$$$  /$$$$$$$  /$$$$$$   /$$$$$$  /$$$$$$$
| $$ /$$$$| $$| $$  | $$|____  $$ /$$$$$$| $$  | $$| $$ /$$_____/ /$$_____/ /$$__  $$ /$$__  $$/$$__  $$
| $$|_  $$| $$| $$  | $$ /$$$$$$$|______/| $$  | $$| $$|  $$$$$$ | $$      | $$  \ $$| $$  \__/ $$  | $$
| $$  \ $$| $$| $$  | $$/$$__  $$        | $$  | $$| $$ \____  $$| $$      | $$  | $$| $$     | $$  | $$
|  $$$$$$/| $$|  $$$$$$/  $$$$$$$        | $$$$$$$/| $$ /$$$$$$$/|  $$$$$$$|  $$$$$$/| $$     |  $$$$$$$
 \______/ |__/ \______/ \_______/        |_______/ |__/|_______/  \_______/ \______/ |__/      \_______/
    Purpose: Webhooks for when the server starts up                                                                                                                                                                                                                                                                                    
]]
hook.Add("InitPostEntity", WEBHOOK, function()
    if !WEBHOOK.modules.server_startup then return end
    local avatar = "https://www.clipartmax.com/png/middle/52-522123_raid-server-icon.png"
    local newHook = Webhook()
    newHook:SetMessage(string.format("[SERVER] Server has started up at %s on %s", game.GetIPAddress(), engine.ActiveGamemode()))
    newHook:SetUsername(GetHostName())
    newHook:SetAvatar(avatar)
    newHook:Send()
end)