-----------------------------------
--  Area: Maze Of Shakhrami
--  NPC:  ???
--  Involved in Eco Warrior (Windurst)
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	if (killer:getQuestStatus(WINDURST,ECO_WARRIOR_WIN) ~= QUEST_AVAILABLE and killer:getVar("ECO_WARRIOR_ACTIVE") == 238 and killer:hasStatusEffect(EFFECT_LEVEL_RESTRICTION)) then
		killer:setVar("ECOR_WAR_WIN-NMs_killed",1);
	end
end;