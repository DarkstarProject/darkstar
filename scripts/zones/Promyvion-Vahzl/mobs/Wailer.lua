-----------------------------------
-- Area: Promyvion vahzl
--  NPC: Wailer
-----------------------------------
require("scripts/zones/Promyvion-Vahzl/MobIDs");
require("scripts/globals/settings");
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(WAILER_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
