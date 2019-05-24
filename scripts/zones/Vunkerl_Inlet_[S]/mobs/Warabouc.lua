-----------------------------------
-- Area: Vunkerl Inlet [S]
--   NM: Warabouc
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(7200 + math.random(0, 600)) -- 2 hours, then 10 minute window
end
