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

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	
	if(killer:getVar("theDoormanMyMob") == 1) then
		killer:setVar("theDoormanKilledNM",killer:getVar("theDoormanKilledNM") + 1);
	end
	
end;