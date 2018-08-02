-----------------------------------
-- Area: Temenos N T
-- NPC:  Kindred_Dark_Knight
-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");
require("scripts/zones/Temenos/MobIDs");
mixins = {require("scripts/mixins/job_special")};
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDespawn(mob)
    if (GetMobByID(16928797):isDead() and GetMobByID(16928798):isDead() and GetMobByID(16928799):isDead()) then
        GetNPCByID(TEMENOS_BASE_CRATE+27):setPos(-120,-80,429);
        GetNPCByID(TEMENOS_BASE_CRATE+27):setStatus(dsp.status.NORMAL);
        GetNPCByID(TEMENOS_BASE_CRATE+161):setPos(-123,-80,429);
        GetNPCByID(TEMENOS_BASE_CRATE+161):setStatus(dsp.status.NORMAL);
        GetNPCByID(TEMENOS_BASE_CRATE+212):setPos(-117,-80,429);
        GetNPCByID(TEMENOS_BASE_CRATE+212):setStatus(dsp.status.NORMAL);
    end
end;