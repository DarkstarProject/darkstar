-----------------------------------
-- Area: Halvung
--  MOB: Big Bomb
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(17031608):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;