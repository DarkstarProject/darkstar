-----------------------------------
-- Area: East Ronfaure
--  Mob: Rambukk
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
end;
