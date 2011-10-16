-----------------------------------
-- Area: Davoi
-- NPC: Barakbok
-- Involved in Quest: The Doorman
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function onMobDeath(mob, killer)
	killer:setVar("BKILLER",1);
end;
