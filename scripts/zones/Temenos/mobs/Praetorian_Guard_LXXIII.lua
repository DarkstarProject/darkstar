-----------------------------------
-- Area: Temenos N T    
-- NPC:  Praetorian_Guard
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

function onMobFight(mob,target)
end;

function onMobDespawn(mob)
    if (GetMobByID(16928809):isDead() and GetMobByID(16928810):isDead() and GetMobByID(16928811):isDead() and 
        GetMobByID(16928812):isDead()) then
        GetNPCByID(TEMENOS_BASE_CRATE+28):setPos(-311,80,419);
        GetNPCByID(TEMENOS_BASE_CRATE+28):setStatus(dsp.status.NORMAL);
        GetNPCByID(TEMENOS_BASE_CRATE+162):setPos(-311,80,417);
        GetNPCByID(TEMENOS_BASE_CRATE+162):setStatus(dsp.status.NORMAL);
        GetNPCByID(TEMENOS_BASE_CRATE+213):setPos(-311,80,421);
        GetNPCByID(TEMENOS_BASE_CRATE+213):setStatus(dsp.status.NORMAL);
        GetNPCByID(16928770+455):setStatus(dsp.status.NORMAL);
    end
end;
