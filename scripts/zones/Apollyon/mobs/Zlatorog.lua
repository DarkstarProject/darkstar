-----------------------------------
-- Area: Apollyon NW
-- NPC:  Zlatorog 

-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------

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
      local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
    GetNPCByID(16932864+108):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+108):setStatus(STATUS_NORMAL);
end;