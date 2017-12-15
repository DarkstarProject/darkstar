-----------------------------------
-- Area: Lufaise Meadows
--  MOB: Amaltheia
-- !pos 347.897 -10.895 264.382 24
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(16875894):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;