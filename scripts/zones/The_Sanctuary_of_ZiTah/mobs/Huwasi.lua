-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  MOB: Huwasi (NM)
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
end;
