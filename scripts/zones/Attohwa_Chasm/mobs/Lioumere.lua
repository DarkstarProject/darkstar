-----------------------------------
-- Area: Attohwa Chasm
-- NPC:  Lioumere
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	if (killer:getCurrentMission(COP) == THE_ROAD_FORKS and killer:getVar("MEMORIES_OF_A_MAIDEN_Status")>=7 and  killer:hasKeyItem(MIMEO_JEWEL)==false) then
		killer:setVar("MEMORIES_OF_A_MAIDEN_Status",8);
		killer:setVar("LioumereKilled",os.time());
	end
end;