local discordWebHook = "https://discord.com/api/webhooks/980834454220193882/IUXvYcA9dyQ6HXjF2WN5roj-D5zY9OsJM_JJwuDkVMQs-lUTe5NZpPnb0DKXWWHUqUX0"

 local function escapeQuotes(str)
     return str:gsub("\"", "\\\"")
 end

 Hook.Add("chatMessage", "discordIntegration", function (msg, client)
     local escapedName = escapeQuotes(client.name)
     local escapedMessage = escapeQuotes(msg)
     Networking.RequestPostHTTP(discordWebHook, function(result) end, '{\"content\": \"'..escapedMessage..'\", \"username\": \"'..escapedName..'\"}')
 end)