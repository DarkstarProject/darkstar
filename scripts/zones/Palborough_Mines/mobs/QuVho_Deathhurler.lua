-----------------------------------
-- Area: Palborough Mines
--  NM:  Qu'Vho Deathhurler
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(3600,4200));
end;
