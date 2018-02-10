-----------------------------------
-- Area: Riverne - Site B01
--  NPC: Unstable Cluster
-----------------------------------
require("scripts/zones/Riverne-Site_B01/MobIDs");
require("scripts/globals/settings");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(UNSTABLE_CLUSTER_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
