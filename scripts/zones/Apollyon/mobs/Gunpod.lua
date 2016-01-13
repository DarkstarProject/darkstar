-----------------------------------
-- Area: Apollyon Central
--  NPC: Gunpod

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
      local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
    GetNPCByID(16932864+259):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+259):setStatus(STATUS_NORMAL);
end;