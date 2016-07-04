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
 
 if (mobID ==16932977) then -- recover
       GetNPCByID(16932864+179):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+179):setStatus(STATUS_NORMAL);
 elseif (mobID ==16932978) then -- timer 1
       GetNPCByID(16932864+262):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+262):setStatus(STATUS_NORMAL);
 elseif (mobID ==16932980) then -- timer 2
      GetNPCByID(16932864+97):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+97):setStatus(STATUS_NORMAL);
 elseif (mobID ==16932981) then -- timer 3
      GetNPCByID(16932864+98):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+98):setStatus(STATUS_NORMAL);    
 end
end;