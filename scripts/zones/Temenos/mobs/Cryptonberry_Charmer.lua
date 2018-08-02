-----------------------------------
-- Area: Temenos N T
-- NPC:  Cryptonberry_Charmer
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
    if (GetMobByID(16928816):isDead() and GetMobByID(16928817):isDead()) then
        GetNPCByID(TEMENOS_BASE_CRATE+38):setPos(-412,-78,426);
        GetNPCByID(TEMENOS_BASE_CRATE+38):setStatus(dsp.status.NORMAL);
        GetNPCByID(TEMENOS_BASE_CRATE+172):setPos(-415,-78,427);
        GetNPCByID(TEMENOS_BASE_CRATE+172):setStatus(dsp.status.NORMAL);
        GetNPCByID(TEMENOS_BASE_CRATE+214):setPos(-412,-78,422);
        GetNPCByID(TEMENOS_BASE_CRATE+214):setStatus(dsp.status.NORMAL);
    end
end;