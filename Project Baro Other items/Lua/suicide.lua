Hook.Add('chatMessage', 'suicide_mod', function(msg, client)
    if msg == '!суицид' and client.Character ~= nil then
        client.Character.Kill(CauseOfDeathType.Unknown)
        return true -- hide message
    end
end)