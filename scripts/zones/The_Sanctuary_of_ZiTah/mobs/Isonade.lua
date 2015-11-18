-----------------------------------
-- Area: The Sanctuary of Zi'Tah
-- NPC:  Isonade
-- Involved in Quest: The Sacred Katana
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, killer)

	if (killer:getQuestStatus(OUTLANDS,THE_SACRED_KATANA) == QUEST_ACCEPTED) then
		killer:setVar("IsonadeKilled",1);
	end

end;