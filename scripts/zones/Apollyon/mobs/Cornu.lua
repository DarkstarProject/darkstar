-----------------------------------
-- Area: Apollyon NE    
--  NPC: Sirins

-----------------------------------
require("scripts/globals/limbus");
local text = require("scripts/zones/Apollyon/TextIDs");

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
 -- print(mobID);
      local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
 

   if (mobID ==16933066) then -- time T3
       GetNPCByID(16932864+84):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+84):setStatus(STATUS_NORMAL);
   elseif (mobID ==16933069) then -- recover
    GetNPCByID(16932864+127):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+127):setStatus(STATUS_NORMAL);
   end
end;