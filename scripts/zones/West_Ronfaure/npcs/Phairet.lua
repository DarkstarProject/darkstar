-----------------------------------
-- Area: West Ronfaure
-- NPC: Phairet
-- NPC for Quest "The Trader in the Forest"
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
require("scripts/zones/West_Ronfaure/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	-- "The Trader in the Forest" Quest status
	theTraderInTheForest = player:getQuestStatus(SANDORIA,THE_TRADER_IN_THE_FOREST);
	
	-- "The Trader in the Forest" Quest Dialogs 
	if (theTraderInTheForest == QUEST_ACCEPTED) then
		count = trade:getItemCount();
		suppliesOrder = trade:hasItemQty(592, 1);
		freeSlots = player:getFreeSlotsCount();
		if (count == 1 and suppliesOrder == true and freeSlots > 0) then
			player:tradeComplete();
			player:startEvent(0x007c);
		else
			player:messageSpecial(6378, 4367);
		end;
	end;

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	player:startEvent(0x0075);
	
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
	
	-- "The Trader in the Forest" Quest
	if (csid == 0x007c) then
		player:addItem(4367);
		player:messageSpecial(6381, 4367);
	end;
		
	
end;



