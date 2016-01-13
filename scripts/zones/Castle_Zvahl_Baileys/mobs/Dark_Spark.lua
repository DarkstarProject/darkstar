-----------------------------------
-- Area: Castle Zvahl Baileys
-- MOB: Dark Spark
-- Involved in Quests: Borghertz's Hands (AF Hands, Many job)
-- @zone 161
-- @pos 63 -24 21
-----------------------------------
local text = require("scripts/zones/Castle_Zvahl_Baileys/TextIDs");
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
    ally:setVar("BorghertzSparkKilled",1);
end;