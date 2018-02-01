-----------------------------------
-- Area: Uleguerand_Range
--  MOB: Geush Urvan
-- Notes: Spawned from qm1
-----------------------------------
require("scripts/zones/Uleguerand_Range/MobIDs");
require("scripts/globals/settings");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(GEUSH_URVAN_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
