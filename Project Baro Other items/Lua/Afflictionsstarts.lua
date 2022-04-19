local afflictioname={"increasedwalkingspeed","increasedswimmingspeed","healdamage","decreasedoxygenconsumption","rigidjoints","inflamedlung","glassjaw","decrepify"}
local afflictionchance={10,10,5,5,20,20,20,20}
--[[
    afflictioname - это название эффектов.
    afflictionchance - их шанс что он окажается на персонаже
--]]

function wait(seconds)
    local start = os.time()
    repeat until os.time() > start + seconds
end

Hook.Add("roundStart","Startafflictions",function()
    print("Aflliction")
    local PlayerCharacter = Client.ClientList
    for j=1,#PlayerCharacter do
        for i=1,#afflictioname do
            if (math.random(0,100) <= afflictionchance[i]) then 
                local burnPrefab = AfflictionPrefab.Prefabs[afflictioname[i]]
                local char = Client.ClientList[j].Character
                local limb = char.AnimController.Limbs[12]
                char.CharacterHealth.ApplyAffliction(limb,burnPrefab.Instantiate(100))
            end
        end
        end  
end)