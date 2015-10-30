-----------------------------------
-- Area: Labyrinth of Onzozo
-- NPC:  Ubume
-- Involved in Quest: Yomi Okuri
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

function onMobDeath(mob,killer)

	if (killer:getQuestStatus(OUTLANDS,YOMI_OKURI) == QUEST_ACCEPTED and killer:getVar("yomiOkuriCS") <= 3) then
		killer:setVar("yomiOkuriKilledNM",1);
	end

end;