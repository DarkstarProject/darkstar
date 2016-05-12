-----------------------------------
-- Area: Apollyon NE    
-- NPC:  Thiazi

-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Apollyon/TextIDs");

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
 local mobID = mob:getID();    
 -- print(mobID);
      local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
 

   if (mobID ==16933063) then -- item
       GetNPCByID(16932864+126):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+126):setStatus(STATUS_NORMAL);
 end
end;