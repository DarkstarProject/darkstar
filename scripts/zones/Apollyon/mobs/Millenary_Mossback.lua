-----------------------------------
-- Area: Apollyon NW
--  NPC: Millenary Mossback

-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Apollyon/TextIDs");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
      local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
    GetNPCByID(16932864+109):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+109):setStatus(STATUS_NORMAL);
end;