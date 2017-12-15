-----------------------------------
-- Area: Quicksand Caves
--  MOB: Tribunus_VII-I
-----------------------------------

function onMobFight(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(17629661):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
