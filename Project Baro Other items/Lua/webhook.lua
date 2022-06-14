 local discordWebHook = "Ссылка на вебхук"

 local function escapeQuotes(str)
     return str:gsub("\"", "\\\"")
 end

 Hook.Add("chatMessage", "discordIntegration", function (message, client)
     local escapedName = escapeQuotes(client.name)
     local escapedMessage = escapeQuotes(message)

     Networking.HttpPost(discordWebHook, function(result) end, '{\"content\": \"'..escapedMessage..'\", \"username\": \"'..escapedName..'\"}')
 end)
