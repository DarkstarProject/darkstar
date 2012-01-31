-----------------------------------
-- Area: Xarcabard
-- NPC:  Boreal Coeurl
-- Involved in Quests: Atop the Highest Mountains
-- @zone 112
-- @pos 580 -9 290
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

	if(killer:getQuestStatus(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_ACCEPTED and killer:hasKeyItem(SQUARE_FRIGICITE) == false) then
		killer:setVar("BorealCoeurlKilled",os.time());
	end

end;