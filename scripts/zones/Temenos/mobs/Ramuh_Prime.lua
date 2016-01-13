-----------------------------------
-- Area: Temenos E T    
--  NPC: mystic Avatar

-----------------------------------
require("scripts/globals/limbus");
local text = require("scripts/zones/Temenos/TextIDs");

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

function onMobDeath(mob,killer,ally)
   local mobID = mob:getID();    
   local mobX = mob:getXPos();
   local mobY = mob:getYPos();
   local mobZ = mob:getZPos();        
    
      if (mobID==16928880) then
           GetNPCByID(16928768+68):setPos(mobX,mobY,mobZ);
           GetNPCByID(16928768+68):setStatus(STATUS_NORMAL);
      end     

end;