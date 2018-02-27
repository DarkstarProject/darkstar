-----------------------------------
-- Area: Promyvion vahzl
--  MOB: Deviator
-----------------------------------
require("scripts/zones/Promyvion-Vahzl/MobIDs");
require("scripts/globals/settings");
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(DEVIATOR_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
