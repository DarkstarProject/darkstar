-----------------------------------
-- Area: Apollyon NE
--  NPC: Thiazi

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


    if (mobID ==16933063) then -- item
       GetNPCByID(16932864+126):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+126):setStatus(STATUS_NORMAL);
 end
end;