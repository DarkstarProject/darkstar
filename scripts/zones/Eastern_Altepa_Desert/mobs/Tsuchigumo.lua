-----------------------------------
-- Area: Eastern Altepa Desert
-- NPC:  Tsuchigumo
-- Involved in Quest: 20 in Pirate Years
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, killer)	
	
	if(killer:getVar("twentyInPirateYearsCS") == 3) then
		killer:setVar("TsuchigumoKilled",killer:getVar("TsuchigumoKilled") + 1);
	end
	
end;