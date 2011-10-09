-----------------------------------
-- Area: The Sanctuary of Zi'Tah
-- NPC: Guardian Treant
-- Involved in Quest: Forge Your Destiny
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function onMobDeath(mob, killer)	
	killer:setVar("ForgeYourDestiny_killed",1);
end;