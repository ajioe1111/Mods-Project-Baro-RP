local afflictioname={"increasedwalkingspeed","increasedswimmingspeed","healdamage","decreasedoxygenconsumption","rigidjoints","inflamedlung","glassjaw","decrepify"}
local afflictionchance={10,10,5,5,20,20,20,20}
--[[
    afflictioname - это название эффектов.
    afflictionchance - их шанс что он окажается на персонаже
--]]
math.randomseed(os.time())

function wait(seconds)
    local start = os.time()
    repeat until os.time() > start + seconds
end

Hook.Add("roundStart","Startafflictions",function()
    wait(5)
    local PlayerCharacter = Client.ClientList
    for j=1,#PlayerCharacter do
        for i=1,#afflictioname do
            if math.random(0,100) <=afflictionchance[i] then
                local burnPrefab = AfflictionPrefab.Prefabs[afflictioname[i]]
                PlayerCharacter[i].CharacterHealth.ApplyAffliction(PlayerCharacter[i].AnimController.MainLimb,burnPrefab.Instantiate(100))
            end
        end
        end  
end)