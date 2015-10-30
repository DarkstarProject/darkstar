-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC:  Radeivepart
-- Starts and Finishes Quest: Northward
-- Involved in Quests: Save the Clock Tower
-- @zone 243
-- @pos 5 9 -39
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (trade:hasItemQty(555,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
		a = player:getVar("saveTheClockTowerNPCz1"); -- NPC Zone1
		if (a == 0 or (a ~= 1 and a ~= 3 and a ~= 5 and a ~= 9 and a ~= 17 and a ~= 7 and a ~= 25 and a ~= 11 and 
		   a ~= 13 and a ~= 19 and a ~= 21 and a ~= 15 and a ~= 23 and a ~= 27 and a ~= 29 and a ~= 31)) then 
			player:startEvent(0x00a0,10 - player:getVar("saveTheClockTowerVar")); -- "Save the Clock Tower" Quest
		end
	elseif (player:getQuestStatus(JEUNO,NORTHWARD) == QUEST_ACCEPTED) then 
		if (trade:hasItemQty(16522,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
			player:startEvent(0x003d); -- Finish quest "Northward"
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:getFameLevel(JEUNO) >= 4 and player:getQuestStatus(JEUNO,NORTHWARD) == QUEST_AVAILABLE) then 
		player:startEvent(000); -- Start quest "Northward" CS NOT FOUND
	else
		player:startEvent(0x009f); -- Standard dialog
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
	if (csid == 0x00a0) then 
		player:setVar("saveTheClockTowerVar",player:getVar("saveTheClockTowerVar") + 1);
		player:setVar("saveTheClockTowerNPCz1",player:getVar("saveTheClockTowerNPCz1") + 1);
	elseif (csid == 000 and option == 0) then 
		player:addQuest(JEUNO,NORTHWARD);
	elseif (csid == 0x003d) then 
		player:completeQuest(JEUNO,NORTHWARD);
		player:addTitle(ENVOY_TO_THE_NORTH);
		if (player:hasKeyItem(MAP_OF_CASTLE_ZVAHL) == false) then
			player:addKeyItem(MAP_OF_CASTLE_ZVAHL);
			player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_CASTLE_ZVAHL);
		end
		player:addFame(JEUNO, JEUNO_FAME*30);
		player:tradeComplete();
	end
end;



