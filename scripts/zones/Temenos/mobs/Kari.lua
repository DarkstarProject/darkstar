-----------------------------------
-- Area: Temenos N T
--  NPC: Kari
-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");
mixins = {require("scripts/mixins/job_special")};
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    GetNPCByID(16928770+452):setStatus(dsp.status.NORMAL);
end;
