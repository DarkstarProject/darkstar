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

function onMobDeath(mob,killer)
 local mobID = mob:getID();	
 -- print(mobID);
  	local mobX = mob:getXPos();
	local mobY = mob:getYPos();
	local mobZ = mob:getZPos();
 
 if (mobID ==16932944) then -- recover
   	GetNPCByID(16932864+264):setPos(mobX,mobY,mobZ);
	GetNPCByID(16932864+264):setStatus(STATUS_NORMAL);
 elseif (mobID ==16932940) then -- timer 1
   	GetNPCByID(16932864+40):setPos(mobX,mobY,mobZ);
	GetNPCByID(16932864+40):setStatus(STATUS_NORMAL);
 elseif (mobID ==16932941) then -- timer 2
  	GetNPCByID(16932864+41):setPos(mobX,mobY,mobZ);
	GetNPCByID(16932864+41):setStatus(STATUS_NORMAL);
 elseif (mobID ==16932938) then -- timer 3
  	GetNPCByID(16932864+42):setPos(mobX,mobY,mobZ);
	GetNPCByID(16932864+42):setStatus(STATUS_NORMAL);	
 end
end;