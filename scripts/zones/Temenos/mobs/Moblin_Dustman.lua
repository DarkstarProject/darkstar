-----------------------------------
-- Area: Temenos N T	
-- NPC:  Moblin_Dustman

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

function onMobDeath(mob,killer)
 local mobID = mob:getID();	
 -- print(mobID);
  	local mobX = mob:getXPos();
	local mobY = mob:getYPos();
	local mobZ = mob:getZPos();
 
 if (mobID ==16928775) then
   	GetNPCByID(16928768+152):setPos(328,70,464);
	GetNPCByID(16928768+152):setStatus(STATUS_NORMAL);
  elseif (mobID ==16928777) then
  	GetNPCByID(16928768+209):setPos(332,70,470);
	GetNPCByID(16928768+209):setStatus(STATUS_NORMAL);
 end
end;