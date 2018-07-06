-----------------------------------
-- Area: Temenos W T
-- NPC: Enhanced_Vulture
-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");
require("scripts/zones/Temenos/MobIDs");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
        GetMobByID(16928959):updateEnmity(target);
        GetMobByID(16928960):updateEnmity(target);
        GetMobByID(16928961):updateEnmity(target);
        GetMobByID(16928962):updateEnmity(target);
        GetMobByID(16928963):updateEnmity(target);
        GetMobByID(16928964):updateEnmity(target);
end;

function onMobDespawn(mob)
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
    if (GetMobByID(16928959):isDead() and GetMobByID(16928960):isDead() and GetMobByID(16928961):isDead()and 
        GetMobByID(16928962):isDead() and GetMobByID(16928963):isDead() and GetMobByID(16928964):isDead()) then
        GetNPCByID(TEMENOS_BASE_CRATE+17):setPos(mobX,mobY,mobZ);
        GetNPCByID(TEMENOS_BASE_CRATE+17):setStatus(dsp.status.NORMAL);
        GetNPCByID(16928770+471):setStatus(dsp.status.NORMAL);
    end
end;
