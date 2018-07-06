-----------------------------------
-- Area: Temenos N T
-- NPC:  Telchines_White_Mage
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

function onMobDeath(mob, player, isKiller)
    if (GetMobByID(16928788):isDead() and GetMobByID(16928789):isDead() and GetMobByID(16928792):isDead() and 
        GetMobByID(16928793):isDead()) then
        GetNPCByID(TEMENOS_BASE_CRATE+26):setPos(19,80,430);
        GetNPCByID(TEMENOS_BASE_CRATE+26):setStatus(dsp.status.NORMAL);
        GetNPCByID(TEMENOS_BASE_CRATE+160):setPos(16,80,430);
        GetNPCByID(TEMENOS_BASE_CRATE+160):setStatus(dsp.status.NORMAL);
        GetNPCByID(TEMENOS_BASE_CRATE+211):setPos(22,80,430);
        GetNPCByID(TEMENOS_BASE_CRATE+211):setStatus(dsp.status.NORMAL);
    end
end;