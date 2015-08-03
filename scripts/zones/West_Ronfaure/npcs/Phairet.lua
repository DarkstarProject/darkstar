-----------------------------------
-- Area: West Ronfaure
-- NPC:  Phairet
-- Involved in Quest: The Trader in the Forest
-- @pos -57 -1 -501 100
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/West_Ronfaure/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	local theTraderInTheforest = player:getQuestStatus(SANDORIA,THE_TRADER_IN_THE_FOREST);
	
	if (theTraderInTheforest == QUEST_ACCEPTED) then
		if (trade:hasItemQty(592,1) == true and trade:getItemCount() == 1) then -- Trade Supplies Order
			player:startEvent(0x007c);
		end
	elseif (theTraderInTheforest == QUEST_COMPLETED) then 
		if (trade:getGil() == 50) then 
			if (player:getFreeSlotsCount() == 0) then 
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4367);
			else
				player:tradeComplete();
				player:addItem(4367);
				player:messageSpecial(ITEM_OBTAINED,4367); -- Clump of Batagreens
			end
		end
	end

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local theTraderInTheforest = player:getQuestStatus(SANDORIA,THE_TRADER_IN_THE_FOREST);
	local hasBatagreens = player:hasItem(4367); -- Clump of Batagreens
	
	if (theTraderInTheforest == QUEST_ACCEPTED) then
		if (hasBatagreens == true) then
			player:startEvent(0x007d);
		else
			player:startEvent(0x0075);
		end
	elseif (theTraderInTheforest == QUEST_COMPLETED or hasBatagreens == false) then
		player:startEvent(0x007f,4367);
	else
		player:startEvent(0x0075);
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
	
	if (csid == 0x007c) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4367);
		else
			player:tradeComplete();
			player:addItem(4367);
			player:messageSpecial(ITEM_OBTAINED, 4367);
		end
	end
	
end;