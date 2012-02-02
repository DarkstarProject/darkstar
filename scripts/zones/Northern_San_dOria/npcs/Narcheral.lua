-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Narcheral
-- Starts and Finishes Quest: Messenger from Beyond
-- @zone 231
-- @pos 129 -11 126
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(player:getQuestStatus(SANDORIA, MESSENGER_FROM_BEYOND) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(1096,1) == true and trade:getItemCount() == 1) then 
			player:startEvent(0x02b2); -- Finish quest "Messenger from Beyond"
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	messengerFromBeyond = player:getQuestStatus(SANDORIA,MESSENGER_FROM_BEYOND);
	
	-- Checking levels and jobs for af quest
	mLvl = player:getMainLvl();
	mJob = player:getMainJob();
	
	if(messengerFromBeyond == QUEST_AVAILABLE and mJob == 3 and mLvl >= 40) then
		player:startEvent(0x02b1); -- Start quest "Messenger from Beyond"
	else
		player:startEvent(0x02b0); -- Standard dialog
	end

end;

-- player:startEvent(0x02b3); -- 
-- player:startEvent(0x02b4); -- Finish quest 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
	
	if(csid == 0x02b1) then
		player:addQuest(SANDORIA,MESSENGER_FROM_BEYOND);
	elseif(csid == 0x02b2) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17422);
		else
			player:addItem(17422);
			player:messageSpecial(ITEM_OBTAINED, 17422); -- Blessed Hammer
			player:tradeComplete();
			player:addFame(SANDORIA,SAN_FAME*30);
			player:completeQuest(SANDORIA,MESSENGER_FROM_BEYOND);
		end
	end
	
end;