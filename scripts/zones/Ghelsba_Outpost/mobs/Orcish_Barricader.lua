-----------------------------------
-- Area: Ghelsba Outpost (140)
--  Mob: Orcish Barricader
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(4200, 5700)) -- 70 to 95 min
end
