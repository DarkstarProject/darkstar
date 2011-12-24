-----------------------------------
-- Area: The Eldieme Necropolis
-- NPC: Sarcophagus
-- Involved in Quest: The Requiem (BARD AF2)
-- @zone 195
-- @pos -414 8 499
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
require("scripts/zones/The_Eldieme_Necropolis/TextIDs");

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end; 

-----------------------------------
-- OnMobDeath Action
-----------------------------------
function onMobDeath(mob, killer)
	killer:setVar("TheRequiemYumKilled",1);
end;