-----------------------------------
-- Area: Quicksand Caves
--  MOB: Tribunus_VII-I
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
local ID = require("scripts/zones/Quicksand_Caves/IDs");
require("scripts/globals/settings");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(ID.npc.TRIBUNUS_VII_I_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
