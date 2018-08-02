-----------------------------------
-- Area: Temenos Central 1floor
-- NPC: Airi
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
    if (GetMobByID(16929047):isDead()) then
        mob:addStatusEffect(dsp.effect.REGAIN,7,3,0);
        mob:addStatusEffect(dsp.effect.REGEN,50,3,0);
    end
end;

function onMobDespawn(mob)
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();

    if (GetMobByID(16929047):isDead() and GetMobByID(16929048):isDead() and GetMobByID(16929049):isDead() and 
        GetMobByID(16929050):isDead() and GetMobByID(16929051):isDead()) then
        GetNPCByID(TEMENOS_BASE_CRATE+71):setPos(mobX,mobY,mobZ);
        GetNPCByID(TEMENOS_BASE_CRATE+71):setStatus(dsp.status.NORMAL);
        GetNPCByID(16928770+472):setStatus(dsp.status.NORMAL);
    end
end;
