Hook.Add("chatMessage", "myChatMessageHook", function(message, client)
    print(client.name .. " написал " .. message)
end)