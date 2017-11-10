-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Stray_Mary
-----------------------------------
require("scripts/zones/Konschtat_Highlands/MobIDs");
require("scripts/globals/titles");

function onMobDeath(mob, player, isKiller)
    player:addTitle(MARYS_GUIDE);
end;

function onMobDespawn(mob)
    -- remove stray mary
    DisallowRespawn(mob:getID(), true);

    -- pick new placeholder
    local phNum = math.random(2);
    local count = 0;
    for k, v in pairs(STRAY_MARY_PH) do
        count = count + 1;
        if (count == phNum) then
            local respawn = GetMobRespawnTime(k);
            DisallowRespawn(k, false);
            GetMobByID(k):setRespawnTime(respawn);
            break;
        end
    end
end;
