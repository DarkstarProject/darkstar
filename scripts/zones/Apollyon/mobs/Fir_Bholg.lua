-----------------------------------
-- Area: Apollyon SW
--  NPC: Fir Bholg

-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Apollyon/TextIDs");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
 local mobID = mob:getID();
 -- print(mobID);
      local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();

 if (mobID ==16932869) then -- time
       GetNPCByID(16932864+14):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+14):setStatus(STATUS_NORMAL);
 elseif (mobID ==16932871) then -- recover
       GetNPCByID(16932864+16):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+16):setStatus(STATUS_NORMAL);
 elseif (mobID ==16932874) then -- item
      GetNPCByID(16932864+15):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+15):setStatus(STATUS_NORMAL);
 end
end;