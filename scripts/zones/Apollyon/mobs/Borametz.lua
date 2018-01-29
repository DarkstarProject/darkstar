-----------------------------------
-- Area: Apollyon NE
--  NPC: Borametz

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
 local mobID = mob:getID();
 -- print(mobID);
  --    local mobX = mob:getXPos();
    --local mobY = mob:getYPos();
    --local mobZ = mob:getZPos();

 if (mobID ==16933048) then -- time T1
       GetNPCByID(16932864+118):setPos(452,-1,30);
    GetNPCByID(16932864+118):setStatus(STATUS_NORMAL);
 elseif (mobID ==16933052) then -- recover
       GetNPCByID(16932864+120):setPos(470,-1,30);
    GetNPCByID(16932864+120):setStatus(STATUS_NORMAL);
 end
end;