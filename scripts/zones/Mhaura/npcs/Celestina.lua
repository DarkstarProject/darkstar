-----------------------------------
-- Area: Mhaura
-- NPC:  Celestina
-- Finish Quest: The Sand Charm
-- @zone 249
-- @pos -36 -16 72
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
require("scripts/zones/Mhaura/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(player:getQuestStatus(OTHER_AREAS,THE_SAND_CHARM) == QUEST_ACCEPTED) then 
		if(trade:hasItemQty(13095,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
			player:startEvent(0x007f); -- Finish quest "The Sand Charm"
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getVar("theSandCharmVar") == 3) then 
		player:startEvent(0x007e,13095); -- During quest "The Sand Charm" - 3rd dialog
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
	if(csid == 0x007e and option == 70) then
		player:setVar("theSandCharmVar",4);
	elseif(csid == 0x007f) then
		player:completeQuest(OTHER_AREAS,THE_SAND_CHARM);
		player:setVar("theSandCharmVar",0);
		player:setVar("SmallDialogByBlandine",1);
		player:addKeyItem(MAP_OF_BOSTAUNIEUX_OUBLIETTE);
		player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_BOSTAUNIEUX_OUBLIETTE);
		player:addFame(OTHER_AREAS,30);
		player:tradeComplete();
	end
end;