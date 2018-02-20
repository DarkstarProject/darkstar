-----------------------------------
-- Area: Promyvion vahzl
--  NPC: Wailer
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(16867688):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;