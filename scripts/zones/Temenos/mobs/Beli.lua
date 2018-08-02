-----------------------------------
-- Area: Temenos N T
-- NPC:  Beli
-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");
require("scripts/zones/Temenos/MobIDs");
mixins = {require("scripts/mixins/job_special")};
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_GIGA);
end;

function onMobEngaged(mob,target)
    GetMobByID(16928781):updateEnmity(target);
    GetMobByID(16928782):updateEnmity(target);
end;

function onMobDespawn(mob)
    if (GetMobByID(16928781):isDead() and GetMobByID(16928782):isDead() and GetMobByID(16928783):isDead()) then
        GetNPCByID(TEMENOS_BASE_CRATE+19):setPos(200,-82,495);
        GetNPCByID(TEMENOS_BASE_CRATE+19):setStatus(dsp.status.NORMAL);
        GetNPCByID(TEMENOS_BASE_CRATE+153):setPos(206,-82,495);
        GetNPCByID(TEMENOS_BASE_CRATE+153):setStatus(dsp.status.NORMAL);
        GetNPCByID(TEMENOS_BASE_CRATE+210):setPos(196,-82,495);
        GetNPCByID(TEMENOS_BASE_CRATE+210):setStatus(dsp.status.NORMAL);
    end
end;