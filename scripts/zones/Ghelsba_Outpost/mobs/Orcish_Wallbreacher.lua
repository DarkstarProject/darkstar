-----------------------------------
-- Area: Ghelsba Outpost (140)
--  MOB: Orcish Wallbreacher
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(3900, 5400)) -- 65 to 90 min
end
