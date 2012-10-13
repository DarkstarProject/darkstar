-----------------------------------
-- Area: Bastok Markets
-- NPC:  Brygid
-- Start & Finishes Quest: Brygid the Stylist
-- Involved in Quests: Riding on the Clouds
-- @zone 235
-- @pos -90 -4 -108
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_2") == 3) then
		if(trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
			player:setVar("ridingOnTheClouds_2",0);
			player:tradeComplete();
			player:addKeyItem(SMILING_STONE);
			player:messageSpecial(KEYITEM_OBTAINED,SMILING_STONE);
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	BrygidTheStylist = player:getQuestStatus(BASTOK,BRYGID_THE_STYLIST);
	body = player:getEquipID(SLOT_BODY);
	legs = player:getEquipID(SLOT_LEGS);

	if(BrygidTheStylist == QUEST_ACCEPTED and body == 12600 and legs == 12832) then
		player:startEvent(0x0137);
	elseif(BrygidTheStylist ~= QUEST_COMPLETED) then
		player:startEvent(0x0136);
	else
		player:startEvent(0x0077);
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
	
	if(csid == 0x0136 and player:getQuestStatus(BASTOK,BRYGID_THE_STYLIST) == QUEST_AVAILABLE) then
		player:addQuest(BASTOK,BRYGID_THE_STYLIST);
	elseif(csid == 0x0137) then
		if(player:getFreeSlotsCount() == 0) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12720);
		else
			player:addTitle(BRYGIDAPPROVED);
			player:addItem(12720);
			player:messageSpecial(ITEM_OBTAINED,12720);
			player:addFame(BASTOK,BAS_FAME*30);
			player:completeQuest(BASTOK,BRYGID_THE_STYLIST);
		end
	end
	
end;