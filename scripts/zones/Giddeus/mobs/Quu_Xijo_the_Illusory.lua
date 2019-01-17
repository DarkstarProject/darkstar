-----------------------------------
-- Area: Giddeus (145)
--   NM: Quu Xijo the Illusory
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(3600, 4200)) -- 60 to 70 minutes
end
