-----------------------------------
-- Area: Batallia Downs (105)
--  Mob: Carpenters Landing
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)

    -- Set Tempest Tigon's spawnpoint and respawn time (1-2 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((3600),(7200)));

end;

