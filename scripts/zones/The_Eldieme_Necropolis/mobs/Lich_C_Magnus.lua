-----------------------------------
-- Area: The Eldieme Necropolis
-- NPC:  Lich_C_Magnus
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(LICH_BANISHER);
	if (killer:getQuestStatus(WINDURST,BLUE_RIBBON_BLUES) == QUEST_ACCEPTED) then
		killer:setVar("Lich_C_Magnus_Died",1);
	end
end;