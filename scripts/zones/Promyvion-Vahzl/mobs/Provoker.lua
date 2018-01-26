-----------------------------------
-- Area: Promyvion vahzl
--  MOB: Provoker
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(16867689):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;