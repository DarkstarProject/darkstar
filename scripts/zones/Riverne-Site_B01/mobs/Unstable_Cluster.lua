-----------------------------------
-- Area: Riverne - Site B01
--  NPC: Unstable Cluster
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(16896175):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;