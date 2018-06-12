-----------------------------------
-- Area: La Theine Plateau
--  MOB: Lumbering Lambert
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local mobId = mob:getID();
    
    DisallowRespawn(mob:getID(), true);
    mob:setLocalVar("cooldown", os.time() + 3600); -- 1 hour
    
    local nmId  = mobId + 1;
    local nm    = GetMobByID(nmId);
    local phId  = mobId - 1;
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
