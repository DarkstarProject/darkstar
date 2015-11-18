-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Ghebi Damomohe
-- Type: Standard Merchant
-- Starts and Finishes Quest: Tenshodo Membership
-- @zone 245
-- @pos 16 0 -5
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
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
	if (player:getQuestStatus(JEUNO,TENSHODO_MEMBERSHIP)~= QUEST_COMPLETED and trade:hasItemQty(548,1) == true and trade:getItemCount() == 1) then 
		player:startEvent(0x006c); -- Finish Quest (don't need fame or starting quest)
	elseif (player:hasKeyItem(PSOXJA_PASS)==false and (trade:hasItemQty(1692,1) or trade:hasItemQty(1694,1) or trade:hasItemQty(1693,1)) and trade:getItemCount() == 1) then
	    --Carmine Chip (Ex) - Snow Lizard or Frost Lizard 
            --Gray Chip (Ex) - Diremite Stalker (at Tower near Ranguemont), Diremite Assaulter, Diremite 
            --Cyan Chip (Ex) - Treasure Chest Mimics 
	        player:startEvent(0x0034);
	end
	-- cs 51 for "Wrong Gem" on Pso'Xja pass.  Not sure which gems should trigger this.
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)        
	local CoPMission = player:getCurrentMission(COP);
	local CoPStatus = player:getVar("PromathiaStatus");
	local PsoXjaPass = player:hasKeyItem(PSOXJA_PASS);
	local GetGems = player:getVar("PXPassGetGems");

	if (player:getFameLevel(JEUNO) >= 3 and player:getQuestStatus(JEUNO,TENSHODO_MEMBERSHIP) == QUEST_AVAILABLE) then 
		player:startEvent(0x006a,8); -- Start Quest (need fame 3 jeuno)
	elseif (CoPMission == DARKNESS_NAMED and PsoXjaPass == false and GetGems == 0) then
		player:startEvent(54); -- Gimme gems for Pso'Xja pass
	elseif (GetGems == 1) then
		player:startEvent(53);
	elseif (player:hasKeyItem(TENSHODO_APPLICATION_FORM) == true) then 
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
	elseif (csid == 0x006a and option == 2) then 
		player:addQuest(JEUNO,TENSHODO_MEMBERSHIP);
	elseif (csid == 0x006b) then 
		player:tradeComplete();
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,548);
		else 
			player:addTitle(TENSHODO_MEMBER);
			player:delKeyItem(TENSHODO_APPLICATION_FORM);
			player:addKeyItem(TENSHODO_MEMBERS_CARD);
			player:messageSpecial(KEYITEM_OBTAINED,TENSHODO_MEMBERS_CARD);
			player:addItem(548);
			player:messageSpecial(ITEM_OBTAINED,548);
			player:addFame(JEUNO,30);
			player:completeQuest(JEUNO,TENSHODO_MEMBERSHIP);
		end
	elseif (csid == 0x006c) then 
		player:addTitle(TENSHODO_MEMBER);
		player:addKeyItem(TENSHODO_MEMBERS_CARD);
		player:messageSpecial(KEYITEM_OBTAINED,TENSHODO_MEMBERS_CARD);
		player:messageSpecial(ITEM_OBTAINED,548);
		player:addFame(JEUNO,30);
		player:completeQuest(JEUNO,TENSHODO_MEMBERSHIP);
		
	elseif (csid == 0x0034) then 	
		player:tradeComplete();
		player:addKeyItem(PSOXJA_PASS);
		player:messageSpecial(KEYITEM_OBTAINED,PSOXJA_PASS);  
		player:addGil(500);
		player:messageSpecial(GIL_OBTAINED,500);
		player:setVar("PXPassGetGems",0);
	elseif (csid == 54) then
		player:setVar("PXPassGetGems",1);
	end
end;



