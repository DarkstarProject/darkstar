-----------------------------------
-- Area: Temenos     
--  NPC: Temenos_Ghrah
-----------------------------------
require("scripts/globals/limbus");
local text = require("scripts/zones/Temenos/TextIDs");

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
    GetNPCByID(16928770+475):setStatus(STATUS_NORMAL);
end;
