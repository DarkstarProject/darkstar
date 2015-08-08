-----------------------------------
-- Area: Caedarva Mire
-- NPC:  Lamia No 27
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	if (player:getQuestStatus(AHT_URHGAN,NOT_MEANT_TO_BE) == QUEST_ACCEPTED and killer:getVar("notmeanttobeCS") == 3 and killer:getVar("notmeanttobeLamia27Killed") < 1) then
		killer:setVar("notmeanttobeLamia27Killed",1);
	end

end;
