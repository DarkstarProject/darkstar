-----------------------------------
-- Area: Toraimorai Canal
--   NM: Oni_Carcass
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(75600, 86400)) -- 21 to 24 hours
end
