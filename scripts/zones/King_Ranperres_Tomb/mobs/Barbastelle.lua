-----------------------------------
-- Area: King Ranperre's Tomb
--  MOB: Barbastelle (NM)
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(1800,5400)); -- 30 to 90 minutes
end;
