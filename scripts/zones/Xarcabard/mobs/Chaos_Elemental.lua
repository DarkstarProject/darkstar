-----------------------------------
-- Area: Xarcabard
--  MOB: Chaos Elemental
-- Spawned for Quest: The Three Magi
-- !pos -335.245 -26.403 -49.190 112
-----------------------------------
require("scripts/zones/Xarcabard/MobIDs");
require("scripts/globals/settings");

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(CHAOS_ELEMENTAL_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
