-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Koropokkur
-----------------------------------

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(3600,5400)); -- 60-90min repop
end;
