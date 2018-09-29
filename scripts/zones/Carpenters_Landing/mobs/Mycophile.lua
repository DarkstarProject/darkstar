-----------------------------------
-- Area: Carpenters' Landing
--  MOB: Mycophile
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(16785729):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;