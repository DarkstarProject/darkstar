-----------------------------------
-- Area: The Boyahda Tree
-- NPC:  Agas
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, killer)
	if (killer:getQuestStatus(JEUNO,SEARCHING_FOR_THE_RIGHT_WORDS) == QUEST_ACCEPTED and not killer:hasKeyItem(MOONDROP)) then
		printf("Agas successfully killed!");
		killer:setVar("Searching_AgasKilled", 1);
	end
end;