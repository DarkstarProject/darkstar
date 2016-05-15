-----------------------------------
-- Area: Apollyon NW
-- NPC:  Kaiser Behemoth

-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------

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
 
 if (mobID ==16932964) then -- recover
       GetNPCByID(16932864+327):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+327):setStatus(STATUS_NORMAL);
 elseif (mobID ==16932966) then -- timer 1
       GetNPCByID(16932864+177):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+177):setStatus(STATUS_NORMAL);
 elseif (mobID ==16932967) then -- timer 2
      GetNPCByID(16932864+189):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+189):setStatus(STATUS_NORMAL);
 elseif (mobID ==16932969) then -- timer 3
      GetNPCByID(16932864+190):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+190):setStatus(STATUS_NORMAL);    
 end
end;