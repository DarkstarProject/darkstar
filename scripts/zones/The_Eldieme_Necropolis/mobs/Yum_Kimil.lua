-----------------------------------
-- Area: The Eldieme Necropolis
-- MOB: Yumi Kimil
-- Involved in Quest: The Requiem (BARD AF2)
-- @pos -414 8 499 195
-----------------------------------

local text = require("scripts/zones/The_Eldieme_Necropolis/TextIDs");
require("scripts/globals/settings");

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- OnMobDeath Action
-----------------------------------
function onMobDeath(mob, killer, ally)
    ally:setVar("TheRequiemYumKilled",1);
end;