-----------------------------------
-- Area: Apollyon NE
--  NPC: Sirin

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


    if (mobID ==16933072) then -- time T1
       GetNPCByID(16932864+125):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+125):setStatus(STATUS_NORMAL);
    elseif (mobID ==16933071) then -- time T2
    GetNPCByID(16932864+83):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+83):setStatus(STATUS_NORMAL);
    end
end;