--[[
  /$$$$$$  /$$                            /$$$$$$$  /$$                                              /$$
 /$$__  $$| $$                           | $$__  $$|__/                                             | $$
| $$  \__/| $$ /$$   /$$ /$$$$$$         | $$  \ $$ /$$  /$$$$$$$  /$$$$$$$  /$$$$$$   /$$$$$$  /$$$$$$$
| $$ /$$$$| $$| $$  | $$|____  $$ /$$$$$$| $$  | $$| $$ /$$_____/ /$$_____/ /$$__  $$ /$$__  $$/$$__  $$
| $$|_  $$| $$| $$  | $$ /$$$$$$$|______/| $$  | $$| $$|  $$$$$$ | $$      | $$  \ $$| $$  \__/ $$  | $$
| $$  \ $$| $$| $$  | $$/$$__  $$        | $$  | $$| $$ \____  $$| $$      | $$  | $$| $$     | $$  | $$
|  $$$$$$/| $$|  $$$$$$/  $$$$$$$        | $$$$$$$/| $$ /$$$$$$$/|  $$$$$$$|  $$$$$$/| $$     |  $$$$$$$
 \______/ |__/ \______/ \_______/        |_______/ |__/|_______/  \_______/ \______/ |__/      \_______/
    Purpose: Set up webhook and website configuration                                                                                                                                                                                                                                                                                          
]]
WEBHOOK = { -- Config table
    passthrough = "http://post-webhook.herokuapp.com/post/", -- Webserver to pass webhook data through
    webhook = "863462515631849532/su8Udm1C-zorau4d3wV3Rq303TQ95uAWS7vHdVwy1r7DXFeMPqTKK9x9BIrAtxWMSCi7", -- Stuff after discord.com/api/webhooks/
    successMessage = true, -- Should messages be printed into console when webhook succeed?
    modules = { -- enable and disable specific modules
        playersay = true,
        server_startup = true,
    },
    APIKEY = "4164C9ED5A6D0612B8E518690BC1B5FD", -- ignore pls don't abuse
}