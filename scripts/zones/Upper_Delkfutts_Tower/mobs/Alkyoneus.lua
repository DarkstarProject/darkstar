-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Alkyoneus
-----------------------------------
local ID = require("scripts/zones/Upper_Delkfutts_Tower/IDs");
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/settings");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(ID.npc.ALKYONEUS_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
