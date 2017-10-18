-----------------------------------
-- Area: Temenos Central 1floor    
-- NPC: Iruci

-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    if (GetMobByID(16929049):isDead()) then
        mob:addStatusEffect(EFFECT_REGAIN,7,3,0);
        mob:addStatusEffect(EFFECT_REGEN,50,3,0);
    end     
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();

    if (
        GetMobByID(16929046):isDead() and
        GetMobByID(16929047):isDead() and
        GetMobByID(16929048):isDead() and
        GetMobByID(16929049):isDead() and
        GetMobByID(16929050):isDead() and
        GetMobByID(16929051):isDead()
    ) then
        GetNPCByID(16928768+71):setPos(mobX,mobY,mobZ);
        GetNPCByID(16928768+71):setStatus(STATUS_NORMAL);
        GetNPCByID(16928770+471):setStatus(STATUS_NORMAL);
    end
end;
