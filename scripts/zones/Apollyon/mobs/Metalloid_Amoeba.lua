-----------------------------------
-- Area: Apollyon SE
-- NPC:  Metalloid_Amoeba

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

function onMobDeath(mob, player, isKiller)
 local mobID = mob:getID();    
 -- print(mobID);
      local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
 
 if (mobID ==16932993) then -- time
       GetNPCByID(16932864+1):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+1):setStatus(STATUS_NORMAL);
 elseif (mobID ==16932996) then -- recover
       GetNPCByID(16932864+3):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+3):setStatus(STATUS_NORMAL);
 elseif (mobID ==16933000) then -- item
      GetNPCByID(16932864+2):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+2):setStatus(STATUS_NORMAL);
 end
end;