-----------------------------------
-- Area: Apollyon NW
--  NPC: Cynoprosopi

-----------------------------------

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
    GetNPCByID(16932864+110):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+110):setStatus(STATUS_NORMAL);
end;