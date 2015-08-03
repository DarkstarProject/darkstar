-----------------------------------
-- Area: Apollyon NE	
-- NPC:  Troglodyte Dhalmel 

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
 
 
  if (IsMobDead(16933115)==true and 
     IsMobDead(16933116)==true and   
     IsMobDead(16933117)==true and
     IsMobDead(16933118)==true and
     IsMobDead(16933119)==true and
     IsMobDead(16933120)==true and
     IsMobDead(16933121)==true and
     IsMobDead(16933122)==true 
    ) then
     -- item
   	GetNPCByID(16932864+178):setPos(mobX,mobY,mobZ);
	GetNPCByID(16932864+178):setStatus(STATUS_NORMAL);
   end
end;