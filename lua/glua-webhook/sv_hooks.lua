--[[
  /$$$$$$  /$$                            /$$$$$$$  /$$                                              /$$
 /$$__  $$| $$                           | $$__  $$|__/                                             | $$
| $$  \__/| $$ /$$   /$$ /$$$$$$         | $$  \ $$ /$$  /$$$$$$$  /$$$$$$$  /$$$$$$   /$$$$$$  /$$$$$$$
| $$ /$$$$| $$| $$  | $$|____  $$ /$$$$$$| $$  | $$| $$ /$$_____/ /$$_____/ /$$__  $$ /$$__  $$/$$__  $$
| $$|_  $$| $$| $$  | $$ /$$$$$$$|______/| $$  | $$| $$|  $$$$$$ | $$      | $$  \ $$| $$  \__/ $$  | $$
| $$  \ $$| $$| $$  | $$/$$__  $$        | $$  | $$| $$ \____  $$| $$      | $$  | $$| $$     | $$  | $$
|  $$$$$$/| $$|  $$$$$$/  $$$$$$$        | $$$$$$$/| $$ /$$$$$$$/|  $$$$$$$|  $$$$$$/| $$     |  $$$$$$$
 \______/ |__/ \______/ \_______/        |_______/ |__/|_______/  \_______/ \______/ |__/      \_______/
    Purpose: Serverside hooks for Glua-Discord                                                                                                                                                                                                                                                                                 
]]
local is_valid_ip = false
local ip
hook.Add("Think", "WEBHOOK-IP-THINK", function()
    if is_valid_ip then hook.Remove("Think", "WEBHOOK-IP-THINK") return end -- Make sure to remove think hook so if statement isn't constantly called
    ip = game.GetIPAddress()
    if string.StartWith(ip, "0.0.0.0") then return end -- IP is invalid, so return
    is_valid_ip = true -- We now know the IP is valid
    hook.Run("WEBHOOK_VALID_IP")
end)