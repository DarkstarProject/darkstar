-----------------------------------
-- Area: Temenos W T    
-- NPC: Enhanced_Pugil

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

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
local cofferID=Randomcoffer(6,GetInstanceRegion(1298));
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
    GetNPCByID(16929240):setStatus(STATUS_NORMAL);
  if (cofferID~=0) then
       GetNPCByID(16928768+cofferID):setPos(mobX,mobY,mobZ);
    GetNPCByID(16928768+cofferID):setStatus(STATUS_NORMAL);
  end
end;
