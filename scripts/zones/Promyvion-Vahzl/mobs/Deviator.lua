-----------------------------------
-- Area: Promyvion vahzl
--  MOB: Deviator
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(16867687):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;