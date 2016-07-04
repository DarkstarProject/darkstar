-----------------------------------
-- Area: Temenos E T    
-- NPC: Dark_Elemental

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

function onMobDeath(mob, player, isKiller)
   local mobID = mob:getID();    
   local mobX = mob:getXPos();
   local mobY = mob:getYPos();
   local mobZ = mob:getZPos();        
     switch (mobID): caseof {
         -- 100 a 106 inclut (Temenos -Northern Tower )
        [16928892] = function (x)
           GetNPCByID(16928768+70):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+70):setStatus(STATUS_NORMAL);
        end    , 
        [16928893] = function (x)
           GetNPCByID(16928768+123):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+123):setStatus(STATUS_NORMAL);
        end    , 
     }
end;