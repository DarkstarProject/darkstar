-----------------------------------
-- Area: Palborough Mines
--  NM:  Qu'Vho Deathhurler
-----------------------------------


-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(3600,4200));
end;
