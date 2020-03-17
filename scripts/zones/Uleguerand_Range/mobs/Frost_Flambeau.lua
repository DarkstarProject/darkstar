-----------------------------------
-- Area: Uleguerand Range
--   NM: Frost Flambeau
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 15)
    mob:setMod(tpz.mod.UFASTCAST, 50)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(7200,9000)) -- 2 to 2.5 hours
end
