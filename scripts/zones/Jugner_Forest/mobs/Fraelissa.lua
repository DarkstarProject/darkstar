-----------------------------------
--  Area: Jugner Forest (104)
--   Mob: Fraelissa
-- @pos 9.320 -0.493 -371.654 104
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Fraelissa spawnpoint and respawn time (1-1.15 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((3600),(4500)));

end;