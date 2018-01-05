-----------------------------------
-- Area: Temple Of Uggalepih
--  MOB: Death from Above
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/MobIDs");
require("scripts/globals/settings");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(DEATH_FROM_ABOVE_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;