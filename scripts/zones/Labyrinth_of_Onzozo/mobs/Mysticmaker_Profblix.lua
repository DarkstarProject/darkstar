----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Mysticmaker Profblix
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,771,2);
    checkGoVregime(player,mob,772,2);
    checkGoVregime(player,mob,774,2);

    -- Set Mysticmaker's spawnpoint and respawn time (2-2.5 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((7200),(9000)));

end;