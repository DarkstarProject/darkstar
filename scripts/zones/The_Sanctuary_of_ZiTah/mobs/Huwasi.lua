-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--   NM: Huwasi
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
end
