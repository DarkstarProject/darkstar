-----------------------------------
-- Area: La Theine Plateau
--  MOB: Battering Ram
-----------------------------------
require("scripts/zones/La_Theine_Plateau/MobIDs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local mobID = mob:getID();

    if (mobID == BATTERING_RAM and math.random(1,100) <= 10) then
        -- what nms are ready to spawn
        local nms = {};
        for i = 1, 2 do
            if (os.time() > GetMobByID(BATTERING_RAM + i):getLocalVar("cooldown")) then
                table.insert(nms, BATTERING_RAM + i);
            end
        end
    
        -- spawn one in its place
        if (#nms > 0) then
            local nmId = nms[math.random(#nms)];
            DisallowRespawn(mobID, true);
            DisallowRespawn(nmId, false);
            UpdateNMSpawnPoint(nmId);
            GetMobByID(nmId):setRespawnTime(GetMobRespawnTime(mobID));
        end
    end
end;
