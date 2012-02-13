-----------------------------------
-- Area: Behemoth's Dominion
-- NPC:  Moxnix Nightgoggle
-- Involved in Quest: The Talekeeper's Gift
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	
	if(killer:getQuestStatus(BASTOK,THE_TALEKEEPER_S_GIFT) == QUEST_ACCEPTED) then
		killer:setVar("theTalekeepersGiftKilledNM",killer:getVar("theTalekeepersGiftKilledNM") + 1);
	end
	
end;