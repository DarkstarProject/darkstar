-----------------------------------
-- Area: Xarcabard
-- NPC:  Boreal Hound
-- Involved in Quests: Atop the Highest Mountains
-- @zone 112
-- @pos -21 -25 -490
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	if(killer:getQuestStatus(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_ACCEPTED and killer:hasKeyItem(TRIANGULAR_FRIGICITE) == false) then
		killer:setVar("BorealHoundKilled",os.time());
	end

end;