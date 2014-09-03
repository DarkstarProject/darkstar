-----------------------------------
-- Area: Palborough Mines
--  NM:  Qu'Vho Deathhurler
-----------------------------------


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((3600),(4200)));
end;
