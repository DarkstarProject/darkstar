-----------------------------------
-- Area: Konschtat Highlands
--   NM: Steelfleece_Baldarich
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");
require("scripts/globals/titles");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ALWAYS_AGGRO, 1);
    mob:setMobMod(dsp.mobMod.MULTI_2HOUR, 1); -- not currently implemented
    mob:setMobMod(dsp.mobMod.DRAW_IN, 1);
end;

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.THE_HORNSPLITTER);
end;

function onMobDespawn(mob)
    local mobId = mob:getID();
    
    DisallowRespawn(mob:getID(), true);
    mob:setLocalVar("cooldown", os.time() + math.random(75600,86400)); -- 21 to 24 hours
    
    local nmId  = mobId - 1;
    local nm    = GetMobByID(nmId);
    local phId  = mobId - 2;
    local ph    = GetMobByID(phId);
    
    if (math.random(1,100) <= 10 and os.time() > nm:getLocalVar("cooldown")) then
        DisallowRespawn(nmId, false);
        UpdateNMSpawnPoint(nmId);
        nm:setRespawnTime(GetMobRespawnTime(phId));
    else
        DisallowRespawn(phId, false);
        ph:setRespawnTime(GetMobRespawnTime(phId));
    end
end;
