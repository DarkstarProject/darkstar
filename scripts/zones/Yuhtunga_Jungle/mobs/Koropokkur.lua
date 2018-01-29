-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Koropokkur
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(3600,5400)); -- 60-90min repop
end;
