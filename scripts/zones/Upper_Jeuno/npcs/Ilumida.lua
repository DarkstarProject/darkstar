-----------------------------------
-- Area: Upper Jeuno
-- NPC: Ilumida
-- Starts and Finishes Quest: A Candlelight Vigil
-- @zone : 244
-- @pos : -75 -1 58
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	aCandlelightVigil = player:getQuestStatus(JEUNO,A_CANDLELIGHT_VIGIL);
	if (player:getFameLevel(JEUNO) >= 4 and aCandlelightVigil == QUEST_AVAILABLE) then 
		player:startEvent(0x00c0); --Start quest : Ilumida asks you to obtain a candle ...
	elseif (aCandlelightVigil == QUEST_ACCEPTED) then 
		if (player:hasKeyItem(HOLY_CANDLE) == true) then
			player:startEvent(0x00c2); --Finish quest : CS NOT FOUND. 
		else
			player:startEvent(0x00c1); -- During quest
		end
	else
		player:startEvent(0x00BD); --Standard dialog
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
	if(csid == 0x00c0 and option == 1) then --just start quest
		player:addQuest(JEUNO,A_CANDLELIGHT_VIGIL);
	elseif(csid == 0x00c2) then --finish quest
		if (player:getFreeSlotsCount() == 0) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13094);
		else
			player:completeQuest(JEUNO,A_CANDLELIGHT_VIGIL);
			player:setTitle(ACTIVIST_FOR_KINDNESS);
			player:addItem(13094);
			player:messageSpecial(ITEM_OBTAINED,13094);
			player:needToZone(true);
			player:addFame(JEUNO,30);
			player:delKeyItem(HOLY_CANDLE);
		end
	end
end;



