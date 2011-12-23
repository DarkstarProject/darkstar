-----------------------------------
-- Area: Castle Zvahl Baileys
-- NPC: Dark Spark
-- Involved in Quests: Borghertz's Hands (AF Hands, Many job)
-- @zone 161
-- @pos 63 -24 21
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Castle_Zvahl_Baileys/TextIDs"] = nil;
require("scripts/zones/Castle_Zvahl_Baileys/TextIDs");

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end; 

-----------------------------------
-- OnMobDeath Action
-----------------------------------
function onMobDeath(mob, killer)
	killer:setVar("painfulMemoryTrosKilled",1);
end;