-----------------------------------
-- Area: Bastok Mines
-- NPC: Gumbah
-- Finishes Quest: Blade of Darkness
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
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

Blades = player:getQuestStatus(BASTOK,BLADE_OF_DARKNESS);
PlayerLevel = player:getMainLvl();

--DARK KNIGHT QUEST
	if PlayerLevel >= 30 and Blades == 0 then
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
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
--
	if (csid == 0x0063) then
		player:addQuest(BASTOK,BLADE_OF_DARKNESS);
	end
	
end;