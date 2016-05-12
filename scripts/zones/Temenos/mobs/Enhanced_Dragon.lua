-----------------------------------
-- Area: Temenos Central 1floor    
-- NPC: Enhanced_Dragon

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
  if (IsMobDead(16929051)==true) then
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
  if (IsMobDead(16929046)==true and IsMobDead(16929047)==true and IsMobDead(16929048)==true and IsMobDead(16929049)==true and IsMobDead(16929050)==true and IsMobDead(16929051)==true) then
       GetNPCByID(16928768+71):setPos(mobX,mobY,mobZ);
    GetNPCByID(16928768+71):setStatus(STATUS_NORMAL);
    GetNPCByID(16928770+471):setStatus(STATUS_NORMAL);
  end
end;
