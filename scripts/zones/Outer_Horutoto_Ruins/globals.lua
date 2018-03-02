-- Zone: Outer Horutoto Ruins (194)
-- Desc: this file contains functions that are shared by multiple luas in this zone's directory
-----------------------------------
require("scripts/zones/Outer_Horutoto_Ruins/MobIDs");
-----------------------------------

OUTER_HORUTOTO_RUINS = {
    --[[..............................................................................................
        set cooldown on trio NMs
        ..............................................................................................]]
    setTrioCooldown = function()
        local pop = os.time() + math.random(2700,3600); -- 45 to 60 minutes
        for i = BALLOON_NM_OFFSET + 1, BALLOON_NM_OFFSET + 3 do
            GetMobByID(i):setLocalVar("pop", pop);
        end
    end,

    --[[..............................................................................................
        has a trio NM spawned or been selected to spawn?
        ..............................................................................................]]
    trioPrimed = function()
        for i = BALLOON_NM_OFFSET + 1, BALLOON_NM_OFFSET + 3 do
            local nm = GetMobByID(i);
            if (nm ~= nil and (nm:isSpawned() or nm:getRespawnTime() ~= 0)) then
                return true;
            end
        end
        return false;
    end,

    --[[..............................................................................................
        check to spawn trio NM.
        ..............................................................................................]]
    balloonDespawn = function(mob)
        local phId = mob:getID();
        local offset = phId - BALLOON_NM_OFFSET;
        
        if (offset >= 0 and offset <= 4 and not OUTER_HORUTOTO_RUINS.trioPrimed() and math.random(1,5) == 1) then
            local nmId = BALLOON_NM_OFFSET + math.random(1,3);
            local nm = GetMobByID(nmId);
            local pop = nm:getLocalVar("pop");
            
            if (os.time() > pop) then
                -- print(string.format("ph %i winner! nm %i will pop in place", phId, nmId));
                DisallowRespawn(phId, true);
                DisallowRespawn(nmId, false);
                UpdateNMSpawnPoint(nmId);
                nm:setRespawnTime(GetMobRespawnTime(phId));

                nm:addListener("DESPAWN", "DESPAWN_"..nmId, function(m)
                    -- print(string.format("nm %i died. ph %i will pop in place", nmId, phId));
                    DisallowRespawn(nmId, true);
                    DisallowRespawn(phId, false);
                    GetMobByID(phId):setRespawnTime(GetMobRespawnTime(phId));
                    m:removeListener("DESPAWN_"..nmId);
                    OUTER_HORUTOTO_RUINS.setTrioCooldown();
                end);
            end
        end
    end,
}

return OUTER_HORUTOTO_RUINS;