-----------------------------------
-- Area: Bastok Mines
-- NPC: Gumbah
-- Finishes Quest: Blade of Darkness
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local Blades = player:getQuestStatus(BASTOK, BLADE_OF_DARKNESS);
	
	if (player:getMainLvl() >= ADVANCED_JOB_LEVEL and  Blades == QUEST_AVAILABLE) then
		--DARK KNIGHT QUEST
		player:startEvent(0x0063);
	else 
		--DEFAULT 
		player:startEvent(0x0034);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x0063) then
		player:addQuest(BASTOK, BLADE_OF_DARKNESS);
	end
end;