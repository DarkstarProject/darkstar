-----------------------------------
-- Area: Davoi
-- NPC: Gavotvut
-- Involved in Quest: The Doorman
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function onMobDeath(mob, killer)
	killer:setVar("GKILLER",1);
end;



