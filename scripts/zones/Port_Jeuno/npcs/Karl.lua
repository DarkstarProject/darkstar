-----------------------------------
-- Area: Port Jeuno
-- NPC: Karl
-- Starts and Finishes Quest: Child's Play
-- @zone 246
-- @pos -60 0 -8
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
	if (player:getQuestStatus(JEUNO,CHILD_S_PLAY) == QUEST_ACCEPTED and trade:hasItemQty(776,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
		player:startEvent(0x0001); -- Finish quest 
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	ChildsPlay = player:getQuestStatus(JEUNO,CHILD_S_PLAY);
	
	if(player:getQuestStatus(JEUNO,THE_WONDER_MAGIC_SET) == QUEST_ACCEPTED and ChildsPlay == QUEST_AVAILABLE) then 
		player:startEvent(0x0000); -- Start quest 
	elseif(ChildsPlay == QUEST_ACCEPTED) then
		player:startEvent(0x003d); -- mid quest CS
	else
		player:startEvent(0x003a); -- Standard dialog
	end

end;
-- Lure of the Wildcat (Jeuno) 0x013c

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
	if(csid == 0x0000) then 
		player:addQuest(JEUNO,CHILD_S_PLAY);
	elseif(csid == 0x0001) then 
		player:completeQuest(JEUNO,CHILD_S_PLAY);
		player:setTitle(TRADER_OF_MYSTERIES);
		player:addKeyItem(WONDER_MAGIC_SET);
		player:messageSpecial(KEYITEM_OBTAINED,WONDER_MAGIC_SET);
		player:addFame(JEUNO,30);
		player:tradeComplete(trade);
	end
end;