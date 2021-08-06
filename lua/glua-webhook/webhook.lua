--[[
  /$$$$$$  /$$                            /$$$$$$$  /$$                                              /$$
 /$$__  $$| $$                           | $$__  $$|__/                                             | $$
| $$  \__/| $$ /$$   /$$ /$$$$$$         | $$  \ $$ /$$  /$$$$$$$  /$$$$$$$  /$$$$$$   /$$$$$$  /$$$$$$$
| $$ /$$$$| $$| $$  | $$|____  $$ /$$$$$$| $$  | $$| $$ /$$_____/ /$$_____/ /$$__  $$ /$$__  $$/$$__  $$
| $$|_  $$| $$| $$  | $$ /$$$$$$$|______/| $$  | $$| $$|  $$$$$$ | $$      | $$  \ $$| $$  \__/ $$  | $$
| $$  \ $$| $$| $$  | $$/$$__  $$        | $$  | $$| $$ \____  $$| $$      | $$  | $$| $$     | $$  | $$
|  $$$$$$/| $$|  $$$$$$/  $$$$$$$        | $$$$$$$/| $$ /$$$$$$$/|  $$$$$$$|  $$$$$$/| $$     |  $$$$$$$
 \______/ |__/ \______/ \_______/        |_______/ |__/|_______/  \_______/ \______/ |__/      \_______/
    Purpose: Set up webhook object and its access methods                                                                                                                                                                                                                                                                                         
]]
local meta = { -- metatable shit
    __call = function(self, _username, _message)
        local meta = {
            __index = Webhook,
        }
        local o = {
            username = _username,
            message = _message,
        } -- New object
        setmetatable(o, meta)
        return o
    end,
}

Webhook = { -- Default values for webhook objects
    username = "[GMOD INTEGRATION]",
    message = "Invalid Message",
    avatar = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Garry%27s_Mod_logo.svg/768px-Garry%27s_Mod_logo.svg.png"
} -- Webhook object to use
setmetatable(Webhook, meta)

function Webhook:GetMessage()
    return self.message
end

function Webhook:SetMessage( message )
    self.message = message
    return self.message -- Pass through for validation
end

function Webhook:GetUsername()
    return self.username
end

function Webhook:SetUsername(username)
    self.username = username
    return self.username
end

function Webhook:GetAvatar()
    return self.avatar 
end

function Webhook:SetAvatar(avatar)
    self.avatar = avatar 
    return self.avatar 
end

function Webhook:Send()
    local user = self:GetUsername()
    local message = self:GetMessage()
    local avatar = self:GetAvatar()

    local url = string.format("%s?username=%s&message=%s&webhook=%s&avatar=%s", WEBHOOK.passthrough, name, message, WEBHOOK.webhook, avatar)
    local function onSuccess()
        if WEBHOOK.successMessage then
            MsgC(Color(100, 200, 100), "[GLUA-DISC] Successfully Sent Webhook")
        end
    end
    local function onError(err)
        MsgC(Color(200, 100, 100), "[GLUA-DISC] Webhook ERROR: " .. err)
    end
    http.Post(url, {}, onSuccess, onError)
end

local newHook = Webhook()

function findAvatar(id, cb)
    http.Fetch("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=" .. WEBHOOK.APIKEY .. "&steamids=" .. id, 
        function(body, size, header, status) -- On Success
            local tbl = util.JSONToTable(body)
            if tbl then
                for _, data in pairs(tbl.response.players) do
                    cb(data.avatarfull)
                end
            end
        end,
        function(error) -- On fail
            print(error)
        end)
end