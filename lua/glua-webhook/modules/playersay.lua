--[[
  /$$$$$$  /$$                            /$$$$$$$  /$$                                              /$$
 /$$__  $$| $$                           | $$__  $$|__/                                             | $$
| $$  \__/| $$ /$$   /$$ /$$$$$$         | $$  \ $$ /$$  /$$$$$$$  /$$$$$$$  /$$$$$$   /$$$$$$  /$$$$$$$
| $$ /$$$$| $$| $$  | $$|____  $$ /$$$$$$| $$  | $$| $$ /$$_____/ /$$_____/ /$$__  $$ /$$__  $$/$$__  $$
| $$|_  $$| $$| $$  | $$ /$$$$$$$|______/| $$  | $$| $$|  $$$$$$ | $$      | $$  \ $$| $$  \__/ $$  | $$
| $$  \ $$| $$| $$  | $$/$$__  $$        | $$  | $$| $$ \____  $$| $$      | $$  | $$| $$     | $$  | $$
|  $$$$$$/| $$|  $$$$$$/  $$$$$$$        | $$$$$$$/| $$ /$$$$$$$/|  $$$$$$$|  $$$$$$/| $$     |  $$$$$$$
 \______/ |__/ \______/ \_______/        |_______/ |__/|_______/  \_______/ \______/ |__/      \_______/
    Purpose: Webhooks for when players speak                                                                                                                                                                                                                                                                                     
]]
hook.Add("PlayerSay", WEBHOOK, function(ply, text)
    if !WEBHOOK.modules.playersay then return end
    local avatar
    findAvatar(ply:SteamID64(), function(avatar) avatar = avatar end)
    local newHook = Webhook()
    newHook:SetMessage(string.format("(MESSAGE) %s", text))
    newHook:SetUsername(ply:Nick())
    newHook:SetAvatar(avatar)
    newHook:Send()
end)