-----------------------------------
-- Area: Riverne - Site B01
--  NPC: Unstable Cluster
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_B01/IDs");
require("scripts/globals/settings");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(ID.npc.UNSTABLE_CLUSTER_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
