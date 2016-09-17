-----------------------------------
-- Area: Palborough Mines
--  NM:  Qu'Vho Deathhurler
-----------------------------------


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(3600,4200));
end;
