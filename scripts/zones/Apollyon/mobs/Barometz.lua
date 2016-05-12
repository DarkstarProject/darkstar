-----------------------------------
-- Area: Apollyon NE    
-- NPC:  Barometz

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
 
 if (mobID ==16933045) then -- time T2
       GetNPCByID(16932864+81):setPos(459,-1,29);
    GetNPCByID(16932864+81):setStatus(STATUS_NORMAL);
 elseif (mobID ==16933049) then -- time T3
       GetNPCByID(16932864+82):setPos(480,-1,-39);
    GetNPCByID(16932864+82):setStatus(STATUS_NORMAL);
 elseif (mobID ==16933055) then -- item 
      GetNPCByID(16932864+119):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+119):setStatus(STATUS_NORMAL);
 end
end;