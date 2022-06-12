 local discordWebHook = "https://discord.com/api/webhooks/985648340173729923/GiRkWflDK5Kw49XMng-AymXQUFkGB1VUcZU8bx8AN3AyuEo719lnAiDSppYGbhieh2B7"

 local function escapeQuotes(str)
     return str:gsub("\"", "\\\"")
 end

 Hook.Add("chatMessage", "discordIntegration", function (message, client)
     local escapedName = escapeQuotes(client.name)
     local escapedMessage = escapeQuotes(message)

     Networking.HttpPost(discordWebHook, function(result) end, '{\"content\": \"'..escapedMessage..'\", \"username\": \"'..escapedName..'\"}')
 end)