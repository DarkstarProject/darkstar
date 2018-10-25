-----------------------------------
-- Area: Konschtat Highlands
--  Mob: Tremor Ram
-----------------------------------
local ID = require("scripts/zones/Konschtat_Highlands/IDs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local mobID = mob:getID();

    if (mobID == ID.mob.TREMOR_RAM and math.random(1,100) <= 10) then
        -- what nms are ready to spawn
        local nms = {};
        for i = 1, 2 do
            if (os.time() > GetMobByID(ID.mob.TREMOR_RAM + i):getLocalVar("cooldown")) then
                table.insert(nms, ID.mob.TREMOR_RAM + i);
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
