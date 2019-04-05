-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Likho
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(3600, 4200)) -- 60 to 70 minutes
end
