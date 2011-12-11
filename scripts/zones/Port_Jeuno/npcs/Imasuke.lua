-----------------------------------
-- Area: Port Jeuno
-- NPC: Imasuke
-- Starts and Finishes Quest: The Antique Collector
-- @zone 246
-- @pos -165 11 94
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
require("scripts/zones/Port_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (player:getQuestStatus(JEUNO,THE_ANTIQUE_COLLECTOR) == QUEST_ACCEPTED and trade:hasItemQty(16631,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
		player:startEvent(0x000f); -- End quest 
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	TheAntiqueCollector = player:getQuestStatus(JEUNO,THE_ANTIQUE_COLLECTOR);
	if(player:getFameLevel(JEUNO) >= 3 and TheAntiqueCollector == QUEST_AVAILABLE) then
		player:startEvent(0x000d); -- Start quest
	elseif(TheAntiqueCollector == QUEST_ACCEPTED) then 
		player:startEvent(0x000e); -- Mid CS
	else
		player:startEvent(0x000c); -- Standard dialog
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
	if(csid == 0x000d and option == 1) then
		player:addQuest(JEUNO,THE_ANTIQUE_COLLECTOR);
	elseif(csid == 0x000f) then
		player:completeQuest(JEUNO,THE_ANTIQUE_COLLECTOR);
		player:setTitle(TRADER_OF_ANTIQUITIES);
		player:addKeyItem(MAP_OF_DELKFUTTS_TOWER);
		player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_DELKFUTTS_TOWER);
		player:addFame(JEUNO,30);
		player:tradeComplete(trade);
	end
end;



