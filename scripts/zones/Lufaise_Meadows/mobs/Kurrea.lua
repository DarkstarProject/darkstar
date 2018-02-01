-----------------------------------
-- Area: Lufaise Meadows
--  MOB: Kurrea
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(16875890):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;