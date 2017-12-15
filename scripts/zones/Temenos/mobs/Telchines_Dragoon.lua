-----------------------------------
-- Area: Temenos N T
--  NPC: Telchines_Dragoon
-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
        GetMobByID(16928791):updateEnmity(target);
end;

function onMobDeath(mob, player, isKiller)
    GetNPCByID(16928770+452):setStatus(STATUS_NORMAL);
end;
