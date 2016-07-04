-----------------------------------
-- Area: Temenos E T    
-- NPC: Water_Elemental

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
        [16928885] = function (x)
           GetNPCByID(16928768+277):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+277):setStatus(STATUS_NORMAL);
        end    , 
        [16928886] = function (x)
           GetNPCByID(16928768+190):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+190):setStatus(STATUS_NORMAL);
        end    , 
        [16928887] = function (x)
           GetNPCByID(16928768+127):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+127):setStatus(STATUS_NORMAL);
        end    , 
        [16928888] = function (x)   
           GetNPCByID(16928768+69):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+69):setStatus(STATUS_NORMAL);
        end    ,
        [16929038] = function (x)   
           if (IsMobDead(16929033)==false) then  
             DespawnMob(16929033);
             SpawnMob(16929039);
           end
        end    ,
     }
end;