-----------------------------------
-- Area: RuAun Gardens
--  MOB: Groundskeeper
-- Note: Place holder Despot
-----------------------------------

require("scripts/zones/RuAun_Gardens/MobIDs");
require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,143,2);
    checkRegime(player,mob,144,1);

    -- Get Groundskeeper ID and check if it is a PH of Despot
    local mobID = mob:getID();

    -- Check if Groundskeeper is within the Despot_PH table
    if (Despot_PH[mobID] ~= nil) then
        -- printf("%u is a PH",mobID);
        -- Get Despot previous ToD
        local Despot_ToD = GetServerVariable("[POP]Despot");

        -- Check if Despot window is open, and there is not an Despot popped already(ACTION_NONE = 0)
        if (Despot_ToD <= os.time(t) and GetMobAction(Despot) == 0) then

            -- printf("Despot window open");
            -- Give Groundskeeper 5 percent chance to pop Despot
            if (math.random(1,20) == 5) then
                -- printf("Despot will pop");
                GetMobByID(Despot):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Despot", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;
