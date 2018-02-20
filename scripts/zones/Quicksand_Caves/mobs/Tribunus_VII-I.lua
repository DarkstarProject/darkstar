-----------------------------------
-- Area: Quicksand Caves
--  MOB: Tribunus_VII-I
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/zones/Quicksand_Caves/MobIDs");
require("scripts/globals/settings");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(TRIBUNUS_VII_I_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
