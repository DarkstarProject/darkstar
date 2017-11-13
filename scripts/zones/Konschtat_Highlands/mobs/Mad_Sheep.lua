-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Mad Sheep
-----------------------------------
require("scripts/zones/Konschtat_Highlands/MobIDs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    if (mob:getLocalVar("firstDepop") == 1) then
        return;
    end
    
    local mobId = mob:getID();
    local nmId = STRAY_MARY_PH[mobId];
    local respawn = GetMobRespawnTime(mobId);
    
    if (nmId ~= nil) then
        
        -- remove current placeholder
        DisallowRespawn(mobId, true);
        
        -- try to spawn stray mary
        if (math.random(100) <= 10) then
            DisallowRespawn(nmId, false);
            GetMobByID(nmId):setRespawnTime(respawn);
        
        -- pick a new placeholder
        else
            local phNum = math.random(2);
            local count = 0;
            for k, v in pairs(STRAY_MARY_PH) do
                count = count + 1;
                if (count == phNum) then
                    DisallowRespawn(k, false);
                    GetMobByID(k):setRespawnTime(respawn);
                    break;
                end
            end
        end
    end
end;
