-----------------------------------
-- Area: Temenos E T	
-- NPC: Air_Elemental

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
        [16928858] = function (x)
		   GetNPCByID(16928768+181):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+181):setStatus(STATUS_NORMAL);
		end	, 
		[16928859] = function (x)
		   GetNPCByID(16928768+217):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+217):setStatus(STATUS_NORMAL);
		end	, 
		[16928860] = function (x)
		   GetNPCByID(16928768+348):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+348):setStatus(STATUS_NORMAL);
		end	, 
		[16928861] = function (x)		   
		   GetNPCByID(16928768+46):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+46):setStatus(STATUS_NORMAL);
		end	, 
		[16929035] = function (x)		   
           if (IsMobDead(16929036)==false) then
		     DespawnMob(16929036);
			 SpawnMob(16929042);
		   end
		end	,
	 }
end;