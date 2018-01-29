-----------------------------------
-- Area: Temenos
--  NPC: Temenos_Ghrah
-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    GetNPCByID(16928770+475):setStatus(STATUS_NORMAL);
end;
