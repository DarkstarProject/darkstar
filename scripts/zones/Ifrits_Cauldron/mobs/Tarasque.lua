-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Tarasque
-- !pos 124 19 163 100
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(17617179):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;