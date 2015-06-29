-----------------------------------
-- Area: Grauberg[S]
-- NPC:  Migratory_Hippogryph
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	if (killer:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_ACCEPTED and killer:getVar("QuestStatus_DNC_AF1")==3) then
		killer:setVar("QuestStatus_DNC_AF1", 4);
	end
end;