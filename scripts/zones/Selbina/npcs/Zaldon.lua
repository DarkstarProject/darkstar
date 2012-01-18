-----------------------------------
-- Area: Selbina
-- NPC:  Zaldon
-- Involved in Quests: Under the sea, A Boy's Dream
-- @zone 248
-- @pos -13 -7 -5
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Selbina/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(player:getQuestStatus(OTHER_AREAS,UNDER_THE_SEA) == QUEST_ACCEPTED and player:hasKeyItem(ETCHED_RING) == false) then 
		if(trade:hasItemQty(4501,1) == true and trade:getItemCount() == 1) then 
			rand = math.random(1,5);
			if(rand == 3) then 
				player:startEvent(0x0023); -- Ring found !
			else
				player:startEvent(0x0024); -- Ring not found...
			end
		end
	elseif(player:getVar("aBoysDreamCS") == 5 and trade:hasItemQty(4562,1) == true and trade:getItemCount() == 1) then
		player:startEvent(0x0055); -- CS for the quest "A Boy's Dream"
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getVar("underTheSeaVar") == 3) then 
		player:startEvent(0x0022,4501); -- During quest "Under the sea" - 3rd dialog
	else
		player:startEvent(0x0096); -- Standard dialog
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
	if(csid == 0x0022) then 
		player:setVar("underTheSeaVar",4);
	elseif(csid == 0x0024) then 
		player:tradeComplete();
	elseif(csid == 0x0023) then 
		player:addKeyItem(ETCHED_RING);
		player:messageSpecial(KEYITEM_OBTAINED,ETCHED_RING);
		player:tradeComplete();
	elseif(csid == 0x0055) then
		player:addKeyItem(KNIGHTS_BOOTS);
		player:messageSpecial(KEYITEM_OBTAINED,KNIGHTS_BOOTS);
		player:setVar("aBoysDreamCS",6);
		player:tradeComplete();
	end
end;



