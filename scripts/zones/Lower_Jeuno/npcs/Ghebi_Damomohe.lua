-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Ghebi Damomohe
-- Type: Standard Merchant
-- Starts and Finishes Quest: Tenshodo Membership
-- @zone 245
-- @pos 16 0 -5
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(player:getQuestStatus(JEUNO,TENSHODO_MEMBERSHIP)~= QUEST_COMPLETED and trade:hasItemQty(548,1) == true and trade:getItemCount() == 1) then 
		player:startEvent(0x006c); -- Finish Quest (don't need fame or starting quest)
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getFameLevel(JEUNO) >= 3 and player:getQuestStatus(JEUNO,TENSHODO_MEMBERSHIP) == QUEST_AVAILABLE) then 
		player:startEvent(0x006a,8); -- Start Quest (need fame 3 jeuno)
	elseif(player:hasKeyItem(TENSHODO_APPLICATION_FORM) == true) then 
		player:startEvent(0x006b); -- Finish Quest
	else
		player:startEvent(0x006a,4); -- Menu without quest
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
	if (csid == 0x006a and option == 0) then
		stock = {0x1135,144,  -- Rice Ball
				 0x1169,2700, -- Eel Kabob 
				 0x1173,3} 	  -- Garlic Cracker
		showShop(player, NORG, stock);
	elseif(csid == 0x006a and option == 2) then 
		player:addQuest(JEUNO,TENSHODO_MEMBERSHIP);
	elseif(csid == 0x006b) then 
		player:tradeComplete();
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,548);
		else 
			player:setTitle(TENSHODO_MEMBER);
			player:delKeyItem(TENSHODO_APPLICATION_FORM);
			player:addKeyItem(TENSHODO_MEMBERS_CARD);
			player:messageSpecial(KEYITEM_OBTAINED,TENSHODO_MEMBERS_CARD);
			player:addItem(548);
			player:messageSpecial(ITEM_OBTAINED,548);
			player:addFame(JEUNO,30);
			player:completeQuest(JEUNO,TENSHODO_MEMBERSHIP);
		end
	elseif(csid == 0x006c) then 
		player:setTitle(TENSHODO_MEMBER);
		player:addKeyItem(TENSHODO_MEMBERS_CARD);
		player:messageSpecial(KEYITEM_OBTAINED,TENSHODO_MEMBERS_CARD);
		player:messageSpecial(ITEM_OBTAINED,548);
		player:addFame(JEUNO,30);
		player:completeQuest(JEUNO,TENSHODO_MEMBERSHIP);
	end
end;



