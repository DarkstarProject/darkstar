-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Pallas
-----------------------------------
require("scripts/zones/Upper_Delkfutts_Tower/MobIDs");
require("scripts/globals/settings");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(PALLAS_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
