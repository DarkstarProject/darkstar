-----------------------------------
-- Area: Temenos N T
-- NPC: Goblin_Warlord
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
GetMobByID(16928831):updateEnmity(target);
GetMobByID(16928832):updateEnmity(target);
GetMobByID(16928833):updateEnmity(target);
GetMobByID(16928834):updateEnmity(target);
end;

function onMobDespawn(mob)
    if (GetMobByID(16928831):isDead() and GetMobByID(16928832):isDead() and GetMobByID(16928833):isDead() and 
        GetMobByID(16928834):isDead() and GetMobByID(16928835):isDead()) then
        GetNPCByID(TEMENOS_BASE_CRATE+39):setPos(-599,85,438);
        GetNPCByID(TEMENOS_BASE_CRATE+39):setStatus(dsp.status.NORMAL);
        GetNPCByID(16928770+457):setStatus(dsp.status.NORMAL);
    end
end;