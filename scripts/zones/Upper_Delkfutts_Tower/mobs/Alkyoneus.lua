-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Alkyoneus
-----------------------------------
require("scripts/zones/Upper_Delkfutts_Tower/MobIDs");
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/settings");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(ALKYONEUS_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
