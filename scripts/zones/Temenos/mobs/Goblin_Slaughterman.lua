-----------------------------------
-- Area: Temenos N T	
-- NPC:  Goblin_Slaughterman

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
 
 if (mobID ==16928773) then
   	GetNPCByID(16928768+18):setPos(330,70,468);
	GetNPCByID(16928768+18):setStatus(STATUS_NORMAL);
  elseif (mobID ==16928772) then
  	GetNPCByID(16928770+450):setStatus(STATUS_NORMAL);  
 end
end;
