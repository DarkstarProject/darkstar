-----------------------------------
-- Area: Newton Movalpolos
--  MOB: Moblin Showman
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(16826573):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;