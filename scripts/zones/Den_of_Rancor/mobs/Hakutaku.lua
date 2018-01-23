-----------------------------------
-- Area: Den of Rancor
--  MOB: HakuTaku
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(17433015):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;