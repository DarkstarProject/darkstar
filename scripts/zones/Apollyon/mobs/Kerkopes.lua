-----------------------------------
-- Area: Apollyon NE	
-- NPC:  Kerkopes

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

function onMobDeath(mob,killer)
 local mobID = mob:getID();	
 -- print(mobID);
  	local mobX = mob:getXPos();
	local mobY = mob:getYPos();
	local mobZ = mob:getZPos();
 

   if (mobID ==16933102) then -- item
   	GetNPCByID(16932864+154):setPos(mobX,mobY,mobZ);
	GetNPCByID(16932864+154):setStatus(STATUS_NORMAL);
  elseif (mobID ==16933104) then -- timer T1
	GetNPCByID(16932864+153):setPos(mobX,mobY,mobZ);
	GetNPCByID(16932864+153):setStatus(STATUS_NORMAL);
  elseif (mobID ==16933106) then --  timer T2
	GetNPCByID(16932864+95):setPos(mobX,mobY,mobZ);
	GetNPCByID(16932864+95):setStatus(STATUS_NORMAL);
  elseif (mobID ==16933108) then --  timer T3
	GetNPCByID(16932864+96):setPos(mobX,mobY,mobZ);
	GetNPCByID(16932864+96):setStatus(STATUS_NORMAL);
 elseif (mobID ==16933109) then -- recover
	GetNPCByID(16932864+155):setPos(mobX,mobY,mobZ);
	GetNPCByID(16932864+155):setStatus(STATUS_NORMAL);
  end
end;