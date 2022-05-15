local ownerni_id={"76561198396183529","76561198264892315"}
local ownernim_id={"76561198131945341"}
local itemprefabname={"Адриан: Очки","Бабаев: Шлем Фригг"}
local itemprefabnamem={"Деймос Дарк (Одежда: СБ)","Деймос Дарк (Одежда: Врач)","Деймос Дарк (Одежда: Инженер)"}
--[[
    ownerni_id - это стим Id, владельца именного предмета  {Андриа Рей,Никита Бабаев}
    ownernim_id - это стим Id, владельца с именным предматам зависящий от професси {Деймос Дарк}
    itemprefabname - это название предметов именных для поисках их.
    itemprefabnamem - названия для мультикласса
--]]
print("Work nominal items lua")
function wait(seconds)
    local start = os.time()
    repeat until os.time() > start + seconds
end
Hook.Add("roundStart","Nominalitems",function()
    wait(5)
    local PlayerCharacter = Client.ClientList
    print(#PlayerCharacter)
for j=1,#PlayerCharacter do
for i=1,#ownerni_id do
    if tostring(PlayerCharacter[j].SteamID) == ownerni_id[i] then
        local prefab = ItemPrefab.GetItemPrefab(itemprefabname[i])
        local firstPlayerCharacter = Client.ClientList[j].Character
            Entity.Spawner.AddToSpawnQueue(prefab, firstPlayerCharacter.Inventory,firstPlayerCharacter.Submarine, nil, nil, function(item)
                print(item.Name .. " Has been spawned.")
            end)
    end
end
end

for j=1,#PlayerCharacter do
    for i=1,#ownernim_id do
        if tostring(PlayerCharacter[j].SteamID) == ownernim_id[i] then
            if PlayerCharacter[j].PreferredJob == "captain" or PlayerCharacter[j].PreferredJob == "securityofficer"  then
                local prefab = ItemPrefab.GetItemPrefab(itemprefabnamem[1])
                local firstPlayerCharacter = Client.ClientList[j].Character
                Entity.Spawner.AddToSpawnQueue(prefab, firstPlayerCharacter.Inventory, firstPlayerCharacter.Submarine, nil, nil, function(item)
                    print(item.Name .. " Has been spawned.")
                end)
            end
            if PlayerCharacter[j].PreferredJob == "medicaldoctor" then
                local prefab = ItemPrefab.GetItemPrefab(itemprefabnamem[2])
                local firstPlayerCharacter = Client.ClientList[j].Character
                Entity.Spawner.AddToSpawnQueue(prefab, firstPlayerCharacter.Inventory, firstPlayerCharacter.Submarine, nil, nil, function(item)
                    print(item.Name .. " Has been spawned.")
                end)
            end
            if PlayerCharacter[j].PreferredJob == "mechanic" or PlayerCharacter[j].PreferredJob == "engineer" then
                local prefab = ItemPrefab.GetItemPrefab(itemprefabnamem[3])
                local firstPlayerCharacter = Client.ClientList[j].Character
                Entity.Spawner.AddToSpawnQueue(prefab,firstPlayerCharacter.Inventory,firstPlayerCharacter.Submarine, nil, nil, function(item)
                    print(item.Name .. " Has been spawned.")
                end)
            end
        end
    end
end  
end)
