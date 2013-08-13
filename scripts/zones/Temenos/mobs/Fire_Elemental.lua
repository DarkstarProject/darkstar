-----------------------------------
-- Area: Temenos E T	
-- NPC: Fire_Elemental

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
   local mobX = mob:getXPos();
   local mobY = mob:getYPos();
   local mobZ = mob:getZPos();		
	 switch (mobID): caseof {
         -- 100 a 106 inclut (Temenos -Northern Tower )
        [16928840] = function (x)
		   GetNPCByID(16928768+173):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+173):setStatus(STATUS_NORMAL);
		end	, 
		[16928841] = function (x)
		   GetNPCByID(16928768+215):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+215):setStatus(STATUS_NORMAL);
		end	, 
		[16928842] = function (x)
		   GetNPCByID(16928768+284):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+284):setStatus(STATUS_NORMAL);
		end	, 
		[16928843] = function (x)		   
		   GetNPCByID(16928768+40):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+40):setStatus(STATUS_NORMAL);
		end	, 
	 }
end;