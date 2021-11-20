Hook.Add('chatMessage', 'suicide_mod', function(msg, client)
    if msg == '!suicide' and client.Character ~= nil then
        client.Character.Kill(CauseOfDeathType.Unknown)
        Game.SendMessage(client.name .. ' Убивает себя!', ChatMessageType.Server)
        return true -- hide message
    end
end)